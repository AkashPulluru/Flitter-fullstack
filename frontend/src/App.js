// App.js
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupFormPage';
import Navigation from './components/Navigation'; 
import PhotosComponent from './components/PhotosComponent';
import UserShowPage from './components/UserShowPage';
import PhotoDetailPage from './components/PhotoDetailPage';
// import Form from './Form';
import { useState } from 'react';
import { useEffect } from 'react';


function App() {
  const [newPost, setNewPost] = useState(null);

  // useEffect(() => {
  //   if (newPost)
  //     setPosts(prevPosts => [newPost, ...prevPosts])
  // }, [newPost])

  return (
    <>
      <Navigation /> 
      <Switch>
        <Route path="/login">
          <LoginFormPage />
        </Route>
        <Route path="/signup">
          <SignupFormPage />
        </Route>
        <Route path="/users/:id" component={UserShowPage} />
        {/* <Route path="/photos">
          <PhotosComponent />
        </Route> */}
        <Route path="/photos/:id" component={PhotoDetailPage} />
      </Switch>
      {/* <Form setNewPost={setNewPost} /> */}
      {/* <PostIndex posts={posts} /> */}
    </>
  );
}
export default App;
