//
//  testViewController.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/25.
//

import UIKit
import Firebase
class testViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    @IBOutlet weak var item: UINavigationItem!
    
    @IBOutlet weak var chatCollectionView: UICollectionView!
  
    @IBOutlet weak var item: UINavigationItem!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTextField: UITextField!
    
    var height: CGFloat = 0.0
    var messages: [ChatMessage] = [ChatMessage(fromUserId: "", text: "", timestamp: 0)]
    
    var groupKey: String? {
        didSet {
            if let key = groupKey {
                fetchMessages()
                FirebaseDataService.instance.groupRef.child(testViewController.toUid!).observeSingleEvent(of: .value, with: { (snapshot) in
                    if let data = snapshot.value as? Dictionary<String, AnyObject> {
                        if let title = data["username"] as? String{
                            self.item.title = title
                        }
                        if let toId = data["to"] as? String {
                            self.participantId = toId
                        }
                    }
                })
            }
        }
    }
    var participantId: String?
    static var toUid: String?
    static func fetchToUid(to toUid: String){
        self.toUid = toUid
    }
    
    func fetchMessages() {
//        if let groupId = self.groupKey {
            let groupMessageRef = FirebaseDataService.instance.groupRef.child(testViewController.toUid!).child("messages")
            groupMessageRef.observe(.childAdded, with: { (snapshot) in
                let messageId = snapshot.key
                let messageRef = FirebaseDataService.instance.messageRef.child(messageId)
                messageRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    guard let dict = snapshot.value as? Dictionary<String, AnyObject> else {
                        return
                    }
                    let message = ChatMessage(
                        fromUserId: dict["fromUserId"] as! String,
                        text: dict["text"] as! String,
                        timestamp: dict["timestamp"] as! NSNumber
                    )
                    self.messages.insert(message, at: self.messages.count - 1)
                    self.chatCollectionView.reloadData()
                    if self.messages.count >= 1 {
                        let indexPath = IndexPath(item: self.messages.count - 1, section: 0)
                        self.chatCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition(), animated: true)
                    }
                    self.chatCollectionView.frame.origin.y = self.height
                })
            })
//        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatCell", for: indexPath) as! NewChatMessageCell
        let message = messages[indexPath.item]
        cell.textLabel.text = message.text
        setupChatCell(cell: cell, message: message)
        if indexPath.row == messages.count - 1 { //count
            cell.containerView.backgroundColor = UIColor.white //머스타드쎌 배경 -> 흰색처리
        }

        if message.text.count > 0 {
            cell.containerViewWidthAnchor?.constant = measuredFrameHeightForEachMessage(message: message.text).width + 32
        }
        return cell
    

    }
    
    
    
   
    
    
    
    
    
    func setupChatCell(cell: NewChatMessageCell, message: ChatMessage) {
        if message.fromUserId == FirebaseDataService.instance.currentUserUid {
            cell.containerView.backgroundColor = UIColor.systemGray6
            cell.textLabel.textColor = UIColor.black
            cell.containerViewRightAnchor?.isActive = true
            cell.containerViewLeftAnchor?.isActive = false
        } else {
            cell.containerView.backgroundColor = UIColor.lightGray
            cell.textLabel.textColor = UIColor.black
            cell.containerViewRightAnchor?.isActive = false
            cell.containerViewLeftAnchor?.isActive = true
        }
    }
    
    
    
    
    
    
    
    private func measuredFrameHeightForEachMessage(message: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
        
    }
    
    @IBAction func collectionViewTapped(_ sender: Any) {
        chatTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
 
        let ref = FirebaseDataService.instance.messageRef.childByAutoId()
        guard let fromUserId = FirebaseDataService.instance.currentUserUid else {
            return
        }
        
        let data: Dictionary<String, AnyObject> = [
            "fromUserId": fromUserId as AnyObject,
            "text": chatTextField.text! as AnyObject,
            "timestamp": NSNumber(value: Date().timeIntervalSince1970)
        ]
        
        ref.updateChildValues(data) { (err, ref) in
            guard err == nil else {
                print(err as Any)
                return
            }
            
            self.chatTextField.text = nil
//            if let groupId = self.groupKey, let toId = self.participantId {
            Database.database().reference().child("group").child(testViewController.toUid!).updateChildValues(["messages": [ref.key:1]])
//                FirebaseDataService.instance.userRef.child(fromUserId).child("groups").updateChildValues([groupId: 1])
//                FirebaseDataService.instance.userRef.child(toId).child("groups").updateChildValues([groupId: 1])
//            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
    
    
    
        
        
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        chatTextField.delegate = self
        let layout = chatCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize.width = view.frame.width
        chatCollectionView.alwaysBounceVertical = true
        sendButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        subscribeToKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        unsubscribeFromKeyboardNotifications()
    }
    
    // get keyboard height and shift the view from bottom to higher
    func keyboardWillShow(_ notification: Notification) {
        if chatTextField.isFirstResponder {
            height = getKeyboardHeight(notification)
            chatCollectionView.frame.origin.y = height
            view.frame.origin.y = -height
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if chatTextField.isFirstResponder {
            chatCollectionView.frame.origin.y = 0
            view.frame.origin.y = 0
        }
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chatTextField.resignFirstResponder()
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        chatCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if newText.length < 1 {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
        return true
    }
    
    
    
    
    

}
