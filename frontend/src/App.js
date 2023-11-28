import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom'; 
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupFormPage';
import Navigation from './components/Navigation'; 
import PhotosComponent from './components/PhotosComponent';
import UserShowPage from './components/UserShowPage';
import PhotoDetailPage from './components/PhotoDetailPage';
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
        <Route exact path="/">
          <Redirect to="/login" /> {/* Redirect from home to login */}
        </Route>
        <Route path="/signup">
          <SignupFormPage />
        </Route>
        <Route path="/users/:id" component={UserShowPage} />
        <Route path="/photos/:id" component={PhotoDetailPage} />
      </Switch>
      {/* <Form setNewPost={setNewPost} /> */}
      {/* <PostIndex posts={posts} /> */}
    </>
  );
}
export default App;
