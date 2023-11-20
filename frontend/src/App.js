// App.js
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupFormPage';
import Navigation from './components/Navigation'; 
import PhotosComponent from './components/PhotosComponent';
import UserShowPage from './components/UserShowPage';

function App() {
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
        {/* <Route path="/users/:id"> */}
        <Route path="/users/:id" component={UserShowPage} />
        {/* </Route>  */}
        <Route path="/photos">
          <PhotosComponent />
        </Route>
      </Switch>
    </>
  );
}
export default App;
