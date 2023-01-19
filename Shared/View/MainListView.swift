//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by IMStudio on 2023/01/17.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView{
             List{
                ForEach(store.list) { memo in
                    
                    NavigationLink{
                         DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                    //Text(memo.content)
                }
                .onDelete(perform: store.delete)
            }
             .listStyle(.plain)
             .navigationTitle("My Memo")
             .toolbar {
                 Button {
                     showComposer = true
                 } label: {
                     Image(systemName: "plus")
                 }
             }
             .sheet(isPresented: $showComposer){
                 ComposeView()
         }        }
        
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
        //MemoCell(memo: Memo(content: "Test"))
    }
}
