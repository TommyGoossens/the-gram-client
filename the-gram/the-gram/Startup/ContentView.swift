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
    @EnvironmentObject var appState: Appstate
    
    @EnvironmentObject var session: SessionStorage
    
    func testFunction() {
        print("Expected behaviour worked")
    }
    var body: some View {
        Group {
            if (session.session != nil) {
                Group {
                    
                    if appState.isShowingNewPostView && appState.selectedTab == .post {
                        Text("").sheet(isPresented: self.$appState.isShowingNewPostView, onDismiss: {
                            self.appState.isShowingNewPostView.toggle()
                            self.appState.selectedTab = .none
                        }, content: {
                            NewPostView(isDisplaying: self.$appState.isShowingNewPostView)
                        })
                    }else{
                        TabView(selection: self.$appState.selectedTab){
                            HomeView()
                                .font(.title)
                                .tabItem {
                                    VStack {
                                        Image(systemName: "house")
                                        Text("Home")
                                    }
                            }
                            .tag(GramViewTabs.home)
                            
                            SearchView()
                                .tabItem{
                                    VStack{
                                        Image(systemName: "magnifyingglass")
                                        Text("Search")
                                    }
                            }.tag(GramViewTabs.search)
                            Text("Post")
                                .tabItem{
                                    VStack{
                                        Image(systemName: "camera")
                                        Text("Post")
                                    }
                            }.tag(GramViewTabs.post)
                            
                            SettingsView()
                                .tabItem{
                                    Image(systemName: "gear")
                                        .resizable().frame(width:150.0, height: 15.0)
                            }.tag(GramViewTabs.settings)
                            
                            ProfileView()
                                .font(.title)
                                .tabItem {
                                    VStack {
                                        Image(systemName: "person.crop.circle")
                                        Text("Profile")
                                    }
                            }
                            .tag(GramViewTabs.profile)
                        }
                    }
                    
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

struct SheetPresenter<Content>: View where Content: View {
    @Binding var presentingSheet: Bool
    var content: Content
    var body: some View {
        Text("adfawdada")
            .sheet(isPresented: self.$presentingSheet, content: { self.content })
            .onAppear {
                DispatchQueue.main.async {
                    self.presentingSheet = true
                }
        }
    }
}
