# Firebase Cloude Firestore Security Rules

```CEL
rules_version = '2';
service cloud.firestore {
    match /databases/{database}/documents {
        match /{collectionName}/{document=**} {
            allow read: if true;
            allow write, update, delete: if request.auth != null;
        }
    }
}
```

## Storage Rules

```CEL
rules_version = '2';
service firebase.storage {
    match /b/{bucket}/o {
        match /{collectionId}/{allPaths=**} {
            allow create, update, write: if request.auth != null && request.auth.uid == collectionId;
            allow read: if request.auth != null;
        }
    }
}
```
