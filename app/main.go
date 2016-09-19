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
	http.HandleFunc("/index/", homeHandler)
	http.HandleFunc("/api/", apiHandler)
	http.HandleFunc("/login/", loginHandler)
	http.HandleFunc("/logout/", logoutHandler)
}

func tmplHandler(w http.ResponseWriter, r *http.Request) {

	if r.URL.Path != "/" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}

	ctx := appengine.NewContext(r)
	u := user.Current(ctx)
	if u == nil {
		http.Redirect(w, r, "/index/", http.StatusFound)
		return
	}

	tpl := template.Must(template.ParseFiles("template/index.html"))
	tpl.Execute(w, "")
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	tpl := template.Must(template.ParseFiles("template/home.html"))
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
	//w.Header().Set("Content-type", "text/html; charset=utf-8")
	ctx := appengine.NewContext(r)
	u := user.Current(ctx)
	if u == nil {
		url, _ := user.LoginURL(ctx, "/#/")
		http.Redirect(w, r, url, http.StatusFound)
		return
	}
	http.Redirect(w, r, "/#/", http.StatusFound)
}
func logoutHandler(w http.ResponseWriter, r *http.Request) {
	ctx := appengine.NewContext(r)
	url, _ := user.LogoutURL(ctx, "/")
	http.Redirect(w, r, url, http.StatusFound)
}
