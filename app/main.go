package main

import (
	"fmt"
	"html/template"
	"net/http"

	"google.golang.org/appengine"
	"google.golang.org/appengine/user"
)

func init() {
	http.HandleFunc("/", tmplHandler)
	http.HandleFunc("/api/", apiHandler)
	http.HandleFunc("/login/", loginHandler)
}

func tmplHandler(w http.ResponseWriter, r *http.Request) {

	if r.URL.Path != "/" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}

	tpl := template.Must(template.ParseFiles("template/index.html"))
	tpl.Execute(w, "")
}

func apiHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "aa")
}

func errorHandler(w http.ResponseWriter, r *http.Request, status int) {
	w.WriteHeader(status)
	if status == http.StatusNotFound {
		fmt.Fprint(w, "custom 404")
	}
}

func loginHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-type", "text/html; charset=utf-8")
	ctx := appengine.NewContext(r)
	u := user.Current(ctx)
	if u == nil {
		url, _ := user.LoginURL(ctx, "/#/hehehe/kame")
		fmt.Fprintf(w, `<a href="%s">Sign in or register</a>`, url)
		return
	}
	url, _ := user.LogoutURL(ctx, "/")
	fmt.Fprintf(w, `Welcome, %s! (<a href="%s">sign out</a>)`, u, url)
}
