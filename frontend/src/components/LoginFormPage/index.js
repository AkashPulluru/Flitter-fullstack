import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect, useHistory } from 'react-router-dom';
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
    if (sessionUser) history.push('/photos'); 
  }, [sessionUser, history]);

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login(email, password))
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