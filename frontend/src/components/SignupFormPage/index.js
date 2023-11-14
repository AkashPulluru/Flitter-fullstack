import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import "./SignupForm.css";

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [credentials, setCredentials] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: ""
  });
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCredentials({ ...credentials, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    dispatch(sessionActions.signup(credentials))
      .catch(async (res) => {
        const data = await res.json();
        if (data && data.errors) setErrors(data.errors);
      });
  };

  return (
    <>
    <div className="header">
      <div className="header-logo">Flittr</div>
    </div>
    <form onSubmit={handleSubmit} className="form">
      <div className="form-title">Sign up for Flittr</div>
      <ul>
        {errors.map((error, idx) => <li key={idx}>{error}</li>)}
      </ul>
      <input
        type="text"
        name="firstName"
        value={credentials.firstName}
        placeholder="First Name"
        onChange={handleChange}
        required
      />
      <input
        type="text"
        name="lastName"
        value={credentials.lastName}
        placeholder="Last Name"
        onChange={handleChange}
        required
      />
      <input
        type="email"
        name="email"
        value={credentials.email}
        placeholder="Email Address"
        onChange={handleChange}
        required
      />
      <input
        type="password"
        name="password"
        value={credentials.password}
        placeholder="Password"
        onChange={handleChange}
        required
      />
      <button type="submit">Sign Up</button>
    </form>
    </>
  );
}

export default SignupFormPage;
