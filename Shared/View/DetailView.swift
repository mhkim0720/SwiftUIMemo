//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by IMStudio on 2023/01/19.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var sotre: MemoStore
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style:  .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Memo View")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement:  .bottomBar) {
                
                Button{
                        showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("Delete Confirm", isPresented: $showDeleteAlert){
                    Button(role: .destructive){
                        sotre.delete(memo: memo)
                        dismiss()
                    }label: {
                        Text("Delete")
                    }
                } message: {
                    Text("Delete the Memo  ? ")
                }
                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer){
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            DetailView(memo: Memo(content: "Hello"))
                        .environmentObject(MemoStore())
        }
        
    }
}
