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
    let gradient: LinearGradient
}

let color1: Color = Color.init(red: 72/255, green: 148/255, blue: 111/255)
let color2: Color = Color.init(red: 167/255, green: 243/255, blue: 148/255)
let color3: Color = Color.init(red: 50/255, green: 87/255, blue: 120/255)
let color4: Color = Color.init(red: 124/255, green: 34/255, blue: 54/255)
let color5: Color = Color.init(red: 88/255, green: 188/255, blue: 240/255)
let color6: Color = Color.init(red: 9/255, green: 90/255, blue: 200/255)
let color7: Color = Color.init(red: 63/255, green: 190/255, blue: 160/255)
let color8: Color = Color.init(red: 25/255, green: 33/255, blue: 170/255)
let color9: Color = Color.init(red: 255/255, green: 190/255, blue: 96/255)
let color10: Color = Color.init(red: 255/255, green: 85/255, blue: 89/255)
let color11: Color = Color.init(red: 213/255, green: 50/255, blue: 175/255)
let color12: Color = Color.init(red: 250/255, green: 230/255, blue: 240/255)

let colors: [[Color]] = [[color1, color2], [color3, color4], [color5, color6], [color7, color8], [color9, color10], [color11, color12]]

struct ContentViews: View {
    
    
    
    let posts: [Post] = [
        .init(id: 0, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 1, setsNum: 8, repsNum: 25, time: 12, title: "Pullups", gradient: LinearGradient(gradient: Gradient(colors: [color3, color4]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 2, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color11, color12]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 3, setsNum: 8, repsNum: 25, time: 12, title: "Squats", gradient: LinearGradient(gradient: Gradient(colors: [color5, color6]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 4, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color7, color8]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 5, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color9, color10]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    Text("Popular Exercises").font(.headline)
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        VStack {
                            HStack {
                            
                            }
                        }
                    }.frame(height: 130).padding(.leading, -15).padding(.trailing, -15)
                    HStack {
                        Text("Exercises: 14")
                        .padding(.leading, 20)
                        .font(.body)
                        
                        Image("plus")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .trailing)
                    }
                    
                
                
                List {
                    ForEach(posts, id: \.id) { post in
                        ExerciseView(post: post)
                    }
                }.padding(.top, 18)
                }
            }
            
        }.navigationBarTitle(Text("Fit Flex"))
        
    }
}

struct ExerciseView: View {
    let post: Post
    
    let rand = Int(arc4random_uniform(UInt32(6)))
    
    var body: some View {
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
                ZStack {
                    Image("pushup")
                    .resizable()
                    .frame(width: 110, height: 100)
                }.frame(width: 200)
                
                
            }.padding(.leading, 8)
            
            
            
                
            
            
        }.padding(.leading, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .topLeading)
            .background(LinearGradient(gradient: Gradient(colors: [colors[rand][0], colors[rand][1]]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}
