package main

import (
	"C"
	"encoding/json"
	"io/ioutil"
	"net/http"
)

type Response struct {
	URI           string `json:"uri"`
	ContentType   string `json:"content_type"`
	ContentLength int64  `json:"content_length"`
	Body          string `json:"body"`
	Status        int    `json:"status"`
	Err           string `json:"error"`
}

func request(data *C.char, req func(string) (*http.Response, error)) *C.char {
	uris := []string{}
	err := json.Unmarshal([]byte(C.GoString(data)), &uris)
	if err != nil {
		return C.CString(err.Error())
	}

	if len(uris) == 0 || (len(uris) == 1 && uris[0] == "") {
		return C.CString("[]")
	}

	c := make(chan *Response)
	for _, uri := range uris {
		go func(u string) {
			resp, err := req(u)
			c <- readRequest(u, resp, err)
		}(uri)
	}

	result := []*Response{}
	for i := 0; i < len(uris); i++ {
		result = append(result, <-c)
	}

	b, err := json.Marshal(result)
	if err != nil {
		return C.CString("{}")
	}

	return C.CString(string(b))
}

func readRequest(uri string, r *http.Response, err error) *Response {
	if err != nil {
		return &Response{URI: uri, Status: r.StatusCode, Err: err.Error()}
	}
	defer r.Body.Close()

	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return &Response{URI: uri, Status: r.StatusCode, Err: err.Error()}
	}

	return &Response{
		URI:           uri,
		ContentType:   r.Header.Get("Content-Type"),
		ContentLength: r.ContentLength,
		Body:          string(body),
		Status:        r.StatusCode,
	}
}

//export get
func get(data *C.char) *C.char {
	return request(data, http.Get)
}

//export head
func head(data *C.char) *C.char {
	return request(data, http.Head)
}

func main() {}
