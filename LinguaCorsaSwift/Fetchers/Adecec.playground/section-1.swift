// Playground - noun: a place where people can play

import UIKit
import Foundation

func buildURL (word:String, language:Int) -> String
{
    let root = "http://www.adecec.net/infcor/xmlreq.php?"
    
    var URLString = root.stringByAppendingFormat("l=%d", language)
    URLString += "&sc=0&c="
    URLString += word.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)

    return URLString

    /*
    NSString *root = @"http://www.adecec.net/infcor/xmlreq.php?";
    
    NSString *URLString = [root stringByAppendingFormat:@"l=%d",self.searchLanguage];
    URLString = [URLString stringByAppendingFormat:@"&sc=%d",self.searchMode];
    URLString = [URLString stringByAppendingFormat:@"&c=%@",[self.request stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    */
}



