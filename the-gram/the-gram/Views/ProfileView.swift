//
//  ProfileView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionStorage
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Profile view"/*@END_MENU_TOKEN@*/)
            Button(action:{
                self.session.signOut()
            }){
                Text("Logout")
            }.buttonStyle(PrimitiveButton(isCancelButton: true))
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
