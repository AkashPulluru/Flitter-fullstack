
# Flittr - A Flickr Clone

Welcome to **Flittr**, a photo-sharing app inspired by Flickr. Flittr allows users to upload, view, and comment on photos.

**Live Site:** [Flittr Live](https://flitter-fullstack.onrender.com/)

## Technologies Used
- **Frontend:** React, Redux
- **Backend:** Ruby on Rails, PostgreSQL
- **Storage:** AWS S3 for image hosting
- **Styling:** CSS

## Key Features

### Dynamic Comment System
Flittr's dynamic comment system allows users to engage with photos. Here's how I implemented this:
- **Challenge:** Implementing a responsive and intuitive comment system.
- **Solution:** Used React for a seamless user interface and Rails API for robust backend support. 
- **Code Snippet:**
  ```javascript
  import React, { useEffect, useState } from 'react';
  import CommentBody from '../CommentBody';

  function CommentList({ photoId }) {
    const [comments, setComments] = useState([]);

    useEffect(() => {
      fetch(`/api/comments?photo_id=${photoId}`)
        .then((response) => response.json())
        .then((data) => setComments(data));
    }, [photoId]);

    return (
      <div className="comments-list">
        {comments.map(comment => (
          <CommentBody key={comment.id} comment={comment} />
        ))}
      </div>
    );
  }

  export default CommentList;
  ```

### User Authentication
Ensuring secure and reliable user authentication was crucial.
- **Challenge:** Creating a seamless login/sign-up experience with session token based authentication.
- **Solution:** Integrated Redux for state management and React Router for smooth navigation.
- **Code Snippet:**
  ```javascript
  import React, { useState, useEffect } from 'react';
  import { useDispatch, useSelector } from 'react-redux';
  import { useHistory } from 'react-router-dom';
  import * as sessionActions from '../../store/session';
  import './LoginForm.css';

  function LoginFormPage() {
    const dispatch = useDispatch();
    const history = useHistory(); 
    const sessionUser = useSelector(state => state.session.user);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    useEffect(() => {
      if (sessionUser) history.push(`/users/${sessionUser.id}`); 
    }, [sessionUser, history]);

    const handleSubmit = (e) => {
      e.preventDefault(); 
      setErrors([]);
      return dispatch(sessionActions.login(email, password))
        .then(user => {
          if (user) {
            history.push(`/users/${user.id}`); 
          }
        })
        .catch(async (res) => {
          const data = await res.json();
          if (data && data.errors) setErrors(data.errors);
        });
    }

    const handleDemoLogin = () => {
      dispatch(sessionActions.login('user1@example.com', 'password1'))
        .catch(async (res) => {
          const data = await res.json();
          if (data && data.errors) setErrors(data.errors);
        });
    }

    return (
      <>
        <div className="header">
          <div className="header-logo">Flittr</div>
        </div>
        <form onSubmit={handleSubmit} className="form">
            <div className="form-title">Log in to Flittr</div>
          <ul>
            {errors.map((error, idx) => <li key={idx}>{error}</li>)}
          </ul>
            <input  
              type="text"
              value={email}
              placeholder="Email address"
              onChange={(e) => setEmail(e.target.value)}
              required
            />
            <input
              type="password"
              value={password}
              placeholder="Password"
              onChange={(e) => setPassword(e.target.value)}
              required
            />
           <button type="submit">Log In</button>
           <button onClick={handleDemoLogin} type="button" className="demo-user">Demo User</button>
        </form>
      </>
    );
  }

  export default LoginFormPage;
  ```

## Database Schema
The database schema is designed to support core features like user profiles, photo uploads, and comments.

- **Users:** Stores user information including encrypted password.
- **Photos:** Contains photo metadata and URLs.
- **Comments:** Links users with comments on specific photos.

## Future Directions
- Implementing photo tagging and search functionality.
- Expanding the album feature for better photo organization.

---
