//
//  MultiLineTextView.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct MultiLineTextView : UIViewRepresentable {
    typealias UIViewType = UITextView
    let placeholderText: String
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTextView>) -> UITextView {
        let textView = UITextView()
        textView.textContainer.lineFragmentPadding = 5
        textView.textContainerInset = .zero
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = placeholderText
        textView.textColor = .placeholderText
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTextView>) {
        if text != "" || uiView.textColor == .label {
            uiView.text = text
            uiView.textColor = .label
        }
        uiView.text = text
        uiView.delegate = context.coordinator
    }
    
    func frame(numLines: CGFloat) -> some View {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> MultiLineTextView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiLineTextView
        
        init(_ parent: MultiLineTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placeholderText
                textView.textColor = .placeholderText
            }
        }
    }
}
