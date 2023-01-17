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
                VStack(alignment: .leading){
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(memo.insertDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
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
    }
}
