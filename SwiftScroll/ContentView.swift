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

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
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
    
    let popEx: [Post] = [
        .init(id: 0, setsNum: 8, repsNum: 25, time: 30, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 1, setsNum: 8, repsNum: 25, time: 12, title: "Pullups", gradient: LinearGradient(gradient: Gradient(colors: [color3, color4]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 2, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color11, color12]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 3, setsNum: 8, repsNum: 25, time: 12, title: "Squats", gradient: LinearGradient(gradient: Gradient(colors: [color5, color6]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 4, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color7, color8]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 5, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color9, color10]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    ]
    
    let posts: [Post] = [
        .init(id: 0, setsNum: 8, repsNum: 25, time: 30, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 1, setsNum: 8, repsNum: 25, time: 12, title: "Pullups", gradient: LinearGradient(gradient: Gradient(colors: [color3, color4]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 2, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color11, color12]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 3, setsNum: 8, repsNum: 25, time: 12, title: "Squats", gradient: LinearGradient(gradient: Gradient(colors: [color5, color6]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 4, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color7, color8]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    .init(id: 5, setsNum: 8, repsNum: 25, time: 12, title: "Pushups", gradient: LinearGradient(gradient: Gradient(colors: [color9, color10]), startPoint: .bottomLeading, endPoint: .topTrailing)),
    
    ]
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    HStack {
                        Text("Popular Exercises").font(.headline)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.showDetail.toggle()
                            }
                            
                        }) {
                            Image(systemName: "chevron.right.circle")
                                .imageScale(.large)
                                .rotationEffect(.degrees(showDetail ? 90 : 0))
                                .scaleEffect(showDetail ? 1.25 : 1)
                                .padding()
                        }
                    }
                    if showDetail {
                        ScrollView (.horizontal, showsIndicators: false) {
                            
                            VStack {
                                HStack {
                                ForEach(popEx, id: \.id) { ex in
                                    NavigationLink(destination: ExerciseDetailView(exercise: ex)) {
                                        ShortExerciseView(exercise: ex)
                                    }.transition(.slide)
                                    
                                    }
                                }
                            }
                        }.frame(height: 70).padding(.leading, -20).padding(.trailing, -20).transition(.moveAndFade)
                    }
                    
                    else {
                        HStack {
                            Spacer()
                            Text("Welcome!")
                            Spacer()
                        }.frame(height: 74).transition(.moveAndFade)
                        
                        
                    }
                    
                    
                }
                
                ForEach(posts, id: \.id) { post in
                    NavigationLink(destination: ExerciseDetailView(exercise: post)) {
                        ExerciseView(post: post)
                    }
                }
            }
            .navigationBarTitle(Text("FitFlex"))
            .foregroundColor(.black)
            
            
        }
        
    }
}

struct ShortExerciseView: View {
    var exercise: Post
    var body: some View {
        Text("\(exercise.title)").frame(width: 100, height: 50).background(LinearGradient(gradient: Gradient(colors: [colors[4][0], colors[4][1]]), startPoint: .bottomLeading, endPoint: .topTrailing))
            .cornerRadius(40)
    }
}



struct ExerciseDetailView: View {
    let exercise: Post
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    let rand = Int(arc4random_uniform(UInt32(backs.count)))
    
    @State var timeRemaining = 45
    @State var restTimeRemaining = 15
    @State var sets = 5
    let timeTotal: CGFloat = 45
    let restTimeTotal: CGFloat = 15
    
    var body: some View {
        
        
        VStack {
            Text("\(exercise.title)").font(.system(size: 36))
            Text("Sets: \(sets)").font(.system(size: 36))
            HStack {
                Button(action: {
                    print("Starting...")

                }) {
                    Text("Start").foregroundColor(.red).font(.system(size: 20))
                }
                Button(action: {
                    print("Stopping...")
                    self.timer
                }) {
                    Text("Stop").foregroundColor(.red).font(.system(size: 20))
                }
            }
            
            if self.timeRemaining > 0 {
                Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                }
            }
                
            else if self.timeRemaining == 0 {
                Text("\(restTimeRemaining)").onReceive(timer) { _ in
                    if self.restTimeRemaining > 0 {
                        self.restTimeRemaining -= 1
                    }
                    else if self.restTimeRemaining == 0 {
                        self.timeRemaining = Int(self.timeTotal)
                        self.restTimeRemaining = Int(self.restTimeTotal)
                        self.sets -= 1
                    }
                }
            }
            
            
            
                HStack {
                    
                    //Rest Capsule
                    ZStack (alignment: .bottom) {
                        Capsule().frame(width: 30, height: 200).foregroundColor(Color(red: 226/255, green: 226/255, blue: 226/255))
                        //make this a gradient
                        if self.restTimeRemaining > 0 {
                            Capsule().frame(width: 30, height: 200*((self.restTimeTotal-CGFloat(self.restTimeRemaining))/(self.restTimeTotal))).foregroundColor(.yellow)
                            
                        }
                        else {
                            Capsule().frame(width: 30, height: 200).foregroundColor(.yellow)
                        }
                    }.animation(.default)
                    
                    //Pushup capsule
                    ZStack (alignment: .bottom) {
                        Capsule().frame(width: 30, height: 200).foregroundColor(Color(red: 226/255, green: 226/255, blue: 226/255))
                        //make this a gradient
                        if self.timeRemaining > 0 {
                            Capsule().frame(width: 30, height: 200*((self.timeTotal-CGFloat(self.timeRemaining))/(self.timeTotal))).foregroundColor(.yellow)                }
                        else {
                            Capsule().frame(width: 30, height: 200).foregroundColor(.yellow)
                        }
                    }.animation(.default)
                    
                }
                
                
            
            ZStack {
                Image("pushup")
                .resizable()
                .frame(width: 210, height: 200)
            }.frame(width: 300)
            
        }
        
    }
}

struct StopWatchButton: View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool

    
    var body: some View {
    let buttonWidth = (UIScreen.main.bounds.size.width / 2) - 12
    
    return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            }
        }
        .background(self.color)
    }
}

struct ExerciseView: View {
    
    let post: Post
    
//    let rand = Int(arc4random_uniform(UInt32(6)))
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("\(post.title)").font(.largeTitle).foregroundColor(.white)
            HStack {
                VStack (alignment: .leading) {
                    Text("Sets: \(post.setsNum)").padding(.top, 20).foregroundColor(.white)
                    Text("Reps: \(post.repsNum)").foregroundColor(.white)
                    HStack {
                        Image("time")
                        //change 30 secs to 30 * reps * sets to minutes
                        Text("\(post.time) sec").foregroundColor(.white)
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
            .background(LinearGradient(gradient: Gradient(colors: [colors[3][0], colors[3][1]]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(10)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}

