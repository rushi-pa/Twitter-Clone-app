//
//  Constants.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-09-03.

import Firebase
let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_Followers = Firestore.firestore().collection("followers")
let COLLECTION_Following = Firestore.firestore().collection("following")
let COLLECTION_Tweet = Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
