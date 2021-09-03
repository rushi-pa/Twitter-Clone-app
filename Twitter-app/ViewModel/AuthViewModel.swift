//
//  AuthViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-18.
//

import SwiftUI
import Firebase
class AuthViewModel: ObservableObject {
    
    @Published var userSession : Firebase.User?
    @Published var isAuthenticating = false;
    @Published var error : Error?
 //   @Published var user : User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email : String, password : String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
            
                print("sign in succesful")
            self.userSession = result?.user
        }
    }
    func Register(email : String , password: String, userName: String, fullName: String, userProfile: UIImage){
            guard let urlImage = userProfile.jpegData(compressionQuality: 0.3) else{
                return
            }
            let filename = NSUUID().uuidString
            let StorageRef = Storage.storage().reference().child(filename)
            StorageRef.putData(urlImage, metadata: nil){
                _, error in
                if let error = error {
                    print("Error uploading the image \(error.localizedDescription)")
                    return
                }else{
                    print("Photo added succesfully")
                }
                StorageRef.downloadURL { url, _ in
                    guard let profileImageUrl = url?.absoluteString else {return}
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print("Sign-up failed\( error.localizedDescription)");
                        }else{
                            print("Sign-up Sucessful");
                        }
                        guard let user = authResult?.user else { return }
                        
                        let data = ["Email" : email,
                                     "FullName" : fullName,
                                     "userName" : userName.lowercased(),
                                     "imageURL" : profileImageUrl,
                                     "uuid" : user.uid];
                        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                            self.userSession = user
                            print("An error occured while processing your request. Please try again! \(String(describing: error?.localizedDescription))")
                        }
                }
            }
        }
    }
    func SignOut(){
        
        userSession = nil
        try? Auth.auth().signOut()
    }
}


