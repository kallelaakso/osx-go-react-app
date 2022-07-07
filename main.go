package main

import (
	"github.com/gobuffalo/packr"
	"github.com/webview/webview"
	"net/http"
)

func main() {
	folder := packr.NewBox("./ui/build")
	http.Handle("/", http.FileServer(folder))
	go http.ListenAndServe(":8000", nil)

	w := webview.New(false)
	defer w.Destroy()
	w.SetTitle("Test Application")
	w.SetSize(1024, 768, webview.HintNone)
	w.Navigate("http://localhost:8000")
	w.Run()
}
