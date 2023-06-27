//
//  ToDoListItemViewModel.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

/// View Model for single item of todolist
class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy =  item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
