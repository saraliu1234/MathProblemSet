//
//  LaTeXView.swift
//  PutnamPreperation
//
//  Created by Lanqing Liu on 2026-09-24.
//

import SwiftUI
import WebKit

struct LaTeXView: UIViewRepresentable {
    let problem_latex: String
    
    func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            webView.isOpaque = false
            webView.backgroundColor = .clear
            webView.scrollView.isScrollEnabled = false
            return webView
        }

        func updateUIView(_ webView: WKWebView, context: Context) {
            guard let katexFolder = Bundle.main.url(
                forResource: "KaTeX",
                withExtension: nil
            ) else {
                webView.loadHTMLString(
                    "<body style='font: 18px -apple-system'>KaTeX folder was not found in the app bundle.</body>",
                    baseURL: nil
                )
                return
            }

            let html = """
            <!doctype html>
            <html>
            <head>
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <link rel="stylesheet" href="katex.min.css">
              <script src="katex.min.js"></script>
              <script src="contrib/auto-render.min.js"></script>
              <style>
                body { font: 17px -apple-system, sans-serif; margin: 0; }
              </style>
            </head>
            <body>
              <div id="problem"></div>
              <script>
                const problem = document.getElementById("problem");
                problem.textContent = \(jsonString(problem_latex));
                renderMathInElement(problem, {
                  delimiters: [
                    { left: "$$", right: "$$", display: true },
                    { left: "$", right: "$", display: false }
                  ],
                  throwOnError: false
                });
              </script>
            </body>
            </html>
            """

            webView.loadHTMLString(html, baseURL: katexFolder)
        }

        private func jsonString(_ value: String) -> String {
            let data = try! JSONEncoder().encode(value)
            return String(data: data, encoding: .utf8)!
        }
}
