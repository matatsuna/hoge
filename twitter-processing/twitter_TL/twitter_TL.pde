//http://kurumi-life.blogspot.jp/2014/07/processing-twitter4j_23.html のコードを一部改変
//ライブラリのインポート
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;

import java.util.*;//Listを使うためのインポート


String consumerKey = "";
String consumerSecret = "";
String accessToken = "";
String accessSecret = "";

Twitter twitter;
List<Status> statuses = null;

void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessSecret);
  TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();

  try {
    statuses = twitter.getHomeTimeline();

    for (Status status : statuses) {
      println(status.getUser().getName() + "\n" + status.getText());
    }
  }
  catch(TwitterException e) {
    println(" Get timeline: " + e + " Status code: " + e.getStatusCode());
  }
}