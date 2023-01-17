//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by IMStudio on 2023/01/17.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        NavigationView{
            List(store.list) { memo in
                MemoCell(memo: memo)
                //Text(memo.content)
            }
            .listStyle(.plain)
            .navigationTitle("My Memo")
        }
        
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
