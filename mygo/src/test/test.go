package main

import "fmt"
import "os"

func main() {
	for i,v:=range(os.Args){
		
		fmt.Println(i,v, os.ExpandEnv(v))
	}
	for i,v:=range(os.Environ()){
		fmt.Println(i,v);
	}
}
