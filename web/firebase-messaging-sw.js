importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

const firebaseConfig = {
  apiKey: "AIzaSyDtWzYAt_uG2ad_g304N4lt-OOFhXdYxwU",
  authDomain: "gas-conference.firebaseapp.com",
  projectId: "gas-conference",
  storageBucket: "gas-conference.appspot.com",
  messagingSenderId: "115588830626",
  appId: "1:115588830626:web:ff569f27f6dd5f4202cefb"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
 console.log("onBackgroundMessage", message);
});