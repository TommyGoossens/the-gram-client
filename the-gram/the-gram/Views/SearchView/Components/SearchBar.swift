//
//  SearchBar.swift
//  The Gram
//
//  Created by Tommy Goossens on 17/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var onSearchTextUpdate: ((String) -> Void)?
    
    class Coordinator: NSObject, UISearchBarDelegate {
        /// Debounce engine
        private var debouncer: Debouncer?

        /// Debounce interval
        var debounceInterval: TimeInterval = 0 {
            didSet {
                guard debounceInterval > 0 else {
                    self.debouncer = nil
                    return
                }
                self.debouncer = Debouncer(seconds: debounceInterval)
            }
        }

        /// Event received when the search textField content changes
        var onSearchTextUpdate: ((String) -> Void)?

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            guard let debouncer = self.debouncer else {
                onSearchTextUpdate?(searchText)
                return
            }
            debouncer.debounce {
                DispatchQueue.main.async {
                    self.onSearchTextUpdate?(searchText )
                }
            }
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        context.coordinator.onSearchTextUpdate = self.onSearchTextUpdate
        context.coordinator.debounceInterval = 1
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = placeholder
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text

    }
}
