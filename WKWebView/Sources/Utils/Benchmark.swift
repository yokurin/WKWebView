//
//  Benchmark.swift
//  WKWebView
//
//  Created by 林　翼 on 2017/10/11.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//


import Foundation

/// 複数計測する場合 (例: Webpageの読み込みなど)
class Benchmarks {
    static let shared = Benchmarks()
    
    // benchmark の index 特定用
    // keys, benchmarks の index は同じにする
    private var keys: [String] = []
    private var benchmarks: [Benchmark] = []
    
    private init(){}
    
    func start(key: String) {
        guard !key.isEmpty else { return }
        self.keys.append(key)
        self.benchmarks.append(Benchmark(key))
    }
    
    func finish(key: String) -> String? {
        guard !key.isEmpty else { return nil }
        guard let index = self.keys.index(of: key) else { return "Not Match loading Start URL and loading End URL. Plase reload this site. Probably you were redirected." }
        let time = self.benchmarks[index].finishWithString()
        
        self.keys.remove(at: index)
        self.benchmarks.remove(at: index)
        
        return time
    }
    
    
    
    
    private class Benchmark {
        
        // 開始時刻を保存する変数
        var startTime: Date
        var key: String
        
        // 処理開始
        init(_ key: String) {
            self.startTime = Date()
            self.key = key
        }
        
        // 処理終了
        func finish() {
            let elapsed = Date().timeIntervalSince(self.startTime) as Double
            let formatedElapsed = String(format: "%.3f", elapsed)
            print("Benchmark: \(key), Elasped time: \(formatedElapsed)(s)")
        }
        
        func finishWithString() -> String {
            let elapsed = Date().timeIntervalSince(self.startTime) as Double
            let formatedElapsed = String(format: "%.3f", elapsed)
            // print("Benchmark: \(key), Elasped time: \(formatedElapsed)(s)")
            
            let url = self.key.count > 36 ?
                "\(self.key.prefix(35))..." : self.key
            return "URL: \(url)\nElasped time: \(formatedElapsed)(s)"
        }
        
        // 処理をブロックで受け取る
        class func measure(key: String, block: () -> ()) {
            let benchmark = Benchmark(key)
            block()
            benchmark.finish()
        }
    }
}
