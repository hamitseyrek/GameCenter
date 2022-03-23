//
//  FirebaseReference.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 19.03.2022.
//

import Firebase

enum FCollectionReference: String {
    case Game
    case User
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
