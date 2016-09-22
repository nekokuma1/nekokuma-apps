package main

import (
	"encoding/json"
	"fmt"
	"html/template"
	"net/http"

	"golang.org/x/net/context"

	"google.golang.org/appengine"
	"google.golang.org/appengine/datastore"
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

	createAccount(ctx, u)

	tpl := template.Must(template.ParseFiles("template/index.html"))
	tpl.Execute(w, "")
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	tpl := template.Must(template.ParseFiles("template/home.html"))
	tpl.Execute(w, "")
}

func apiHandler(w http.ResponseWriter, r *http.Request) {

	ctx := appengine.NewContext(r)
	u := user.Current(ctx)
	if u == nil {
		http.Redirect(w, r, "/index/", http.StatusFound)
		return
	}

	account, exists := getAccount(ctx, u)

	if !exists {
		http.Redirect(w, r, "/index/", http.StatusFound)
		return
	}

	js, list_err := json.Marshal(account)
	if list_err != nil {
		http.Error(w, list_err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(js)
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

type Account struct {
	Account string
	Name    string
	Groups  []*datastore.Key
}

func getAccount(c context.Context, user *user.User) (Account, bool) {
	var e Account
	key := datastore.NewKey(c, "Accounts", user.Email, 0, nil)

	datastore.Get(c, key, &e)

	return e, e.Account != ""
}

func createAccount(c context.Context, user *user.User) {

	_, exists := getAccount(c, user)
	if exists {
		return
	}

	key := datastore.NewKey(c, "Accounts", user.Email, 0, nil)

	a := Account{
		Account: user.Email,
		Name:    user.ClientID,
	}

	datastore.Put(c, key, &a)
}
