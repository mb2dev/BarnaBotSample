//
//  ViewController.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 25/01/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import UIKit


class ViewController: JSQMessagesViewController,BBSessionDelegate {
    
    var messages = [JSQMessage]()
    var showTypingIndicatorTimer:Timer?;
    
    var botBuilder : BBBuilder = BBBuilder("Barnabot")
    var botSession : BBSession = BBSession.sharedInstance

    
    
    func send(_ msg: String) {
        print("send from BBSessionDelegate")
        let message = JSQMessage(senderId: botBuilder.botName, senderDisplayName:   botBuilder.botName, date: Date.init(), text: msg as String!)
        self.messages.append(message!)
        self.finishSendingMessage(animated: true)
    }
    
    // TODO inutile
    func receive(_ msg : String) {
        print("bonjour")
        botSession.receive(msg)
    }
    
    func writing() -> Void{
       print("bonjour")
    }
    
    
    override func viewDidLoad() {
        print("bonjour")
        super.viewDidLoad()
        self.navigationController?.navigationBar.layer.zPosition = -1;
        self.senderId = "1234"
        self.senderDisplayName="1234"
        self.collectionView?.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        self.collectionView?.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        
        botBuilder
            .dialog(path: "/", [{(session : BBSession, next : BBDialog?) -> Void in
                if let name = session.userData["name"] {
                    if let _next = next {
                        _next.next!(session, nil)
                    }
                } else {
                    session.beginDialog(path: "/profile")
                }
            }])
            .dialog(path: "/profile", [{(session : BBSession, next : BBDialog?) -> Void in
                print("yop")
                self.send("Hi! What is your name?")
                //session.promptText("Hi! What is your name?")
                },{(session : BBSession, next : BBDialog?) -> Void in
                    print("on passe ici")
                    session.promptText("Hi " + session.result)
                    session.promptText("My name is Barnabot")
                    session.userData.updateValue(session.result, forKey: "name")
                    session.endDialog()
                }])

                    
                    
        
        /*botBuilder
            .dialog(path: "/", dialog: BBDialog(waterfall: [{(session : BBSession, next : BBDialog?) -> Void in
                if let name = session.userData["name"] {
                    if let _next = next {
                        _next.next(session, nil)
                    }
                } else {
                    session.beginDialog(path: "/profile")
                }
                },
                {(session : BBSession, next : BBDialog?) -> Void in
                    if let name = session.userData["name"] {
                        //session.send(format: "Hello %s!", args: name as AnyObject)
                        session.send("Hello \(name)!")
                        session.endDialog()
                    }
                }]))
            .dialog(path: "/profile", dialog : BBDialog(waterfall: [{(session : BBSession, next : BBDialog?) -> Void in
                session.promptText("Hi! What is your name?")
                
                },{(session : BBSession, next : BBDialog?) -> Void in
                    print("on passe ici")
                    session.promptText("Hi " + session.result)
                    session.promptText("My name is Barnabot")
                    session.userData.updateValue(session.result, forKey: "name")
                    session.endDialog()
                }]))
        
        botBuilder.dialog(path: "/end", dialog : BBDialog(waterfall: [{(session : BBSession, next : BBDialog?) -> Void in
            session.promptText("OK! See you tomorrow?")
            },{(session : BBSession, next : BBDialog?) -> Void in
                session.endDialog()
            }]))*/
        
        //botBuilder.matches(regex: "bonjour", idDialog: "/",priority: 0);
        //botBuilder.matches(regex: "au revoir", idDialog: "/end",priority: 0);
        //botSession.botBuilder = botBuilder
        botSession.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        botSession.beginConversation()
    }
    
    
    
    
    
    override func didPressSend(_ button: UIButton, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        messages += [JSQMessage(senderId: self.senderId, displayName: self.senderDisplayName, text: text)]
        
        self.finishSendingMessage(animated: false)
        receive(text)
        
        
    }
    
    func onNewMessageReceived(notification:NSNotification)
    {
        
    }
    
    func UserTyping(notification:NSNotification)
    {
        self.showTypingIndicator = true;
        
        
    }
    
    
    func TypingFire()
    {
        self.showTypingIndicator = false;
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return self.messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        
        let message = self.messages[indexPath.item];
        let factory = JSQMessagesBubbleImageFactory();
        
        if(message.senderId == self.senderId)
        {
            return factory!.outgoingMessagesBubbleImage(with: UIColor.lightGray);
        }
        return factory!.incomingMessagesBubbleImage(with: UIColor.blue)
    }
    
    
}

