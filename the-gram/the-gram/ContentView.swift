//
//  ContentView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {    
    @State private var selection = 0
    @EnvironmentObject var session: SessionStorage
    var body: some View {
        Group {
            if (session.session != nil) {
                TabView(selection: $selection){
                    HomeView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "house")
                                Text("Home")
                            }
                    }
                    .tag(0)
                    
                    SearchView()
                        .tabItem{
                            VStack{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                    }.tag(1)
                    
                    Text("Post")
                        .tabItem{
                            VStack{
                                Image(systemName: "camera")
                                Text("Post")
                            }
                    }.tag(2)
                    
                    SettingsView()
                        .tabItem{
                            Image(systemName: "gear")
                                .resizable().frame(width:150.0, height: 15.0)
                    }.tag(3)
                    
                    ProfileView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                            }
                    }
                    .tag(4)
                }
            }
                
            else{
                AuthenticationView()
            }
        }.onAppear(perform: getUser)
    }
    
    
    func getUser() {
        print(session.session != nil)
        session.listen()
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStorage())
    }
}
#endif
