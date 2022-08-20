// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: process.env.NEXT_PUBLIC_FIREBASE_PUBLIC_API_KEY,
  authDomain: process.env.NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN,
  projectId: process.env.NEXT_PUBLIC_FIREBASE_PROJECT_ID,
  storageBucket: process.env.NEXT_PUBLIC_FIREBASE_STORAGE,
  messagingSenderId: process.env.NEXT_PUBLIC_FIREBASE_MESSAGING_ID,
  appId: process.env.NEXT_PUBLIC_FIREBASE_APP_ID,
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
