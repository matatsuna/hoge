//http://twitter4j.org/ja/code-examples.html のコードを一部改変
//ライブラリのインポート
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;

String consumerKey = "";
String consumerSecret = "";
String accessToken = "";
String accessSecret = "";

Twitter twitter;

void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessSecret);
  TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();
  try {
    Status status = twitter.updateStatus("Hello,World!!");
    println("Successfully updated the status to [" + status.getText() + "].");
  }
  catch(TwitterException e) {
    println(e);
  }
}