//
//  ContentView.swift
//  SwiftScroll
//
//  Created by Connor Lagana on 4/18/20.
//  Copyright © 2020 Connor Lagana. All rights reserved.
//

import SwiftUI

struct  Post: Identifiable {
    var id: Int
    let setsNum, repsNum, time: Int
    let title: String
}

struct ContentViews: View {
    
    let posts: [Post] = [
    .init(id: 0, setsNum: 8, repsNum: 25, time: 12, title: "Pushups"),
    .init(id: 1, setsNum: 5, repsNum: 10, time: 30, title: "Bench Press"),
    .init(id: 2, setsNum: 2, repsNum: 20, time: 18, title: "Squats"),
    .init(id: 3, setsNum: 3, repsNum: 10, time: 10, title: "Planks"),
    .init(id: 4, setsNum: 10, repsNum: 8, time: 14, title: "Situps")
    ]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Fit Flex")
                .font(.headline)
                .padding(.leading, 20)
                
            Text("Exercises: 14")
                .padding(.leading, 20)
                .font(.body)
        
        
        List {
            ForEach(posts, id: \.id) { post in
                VStack (alignment: .leading) {
                    Text("\(post.title)").font(.largeTitle).foregroundColor(.white)
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Sets: \(post.setsNum)").padding(.top, 20).foregroundColor(.white)
                            Text("Reps: \(post.repsNum)").foregroundColor(.white)
                            HStack {
                                Image("time")
                                Text("\(post.time) min").foregroundColor(.white)
                            }
                        }
                        Image("pushup")
                        .resizable()
                        .frame(width: 110, height: 100)
                        
                    }.padding(.leading, 8)
                    
                    
                    
                        
                    
                    
                }.padding(.leading, 10)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .topLeading)
                .background(Color.red)
                .cornerRadius(10)
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}
