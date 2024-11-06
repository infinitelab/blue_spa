"use client";

import LoadinButton from "@/app/components/core/LoadinButton";
import { useAuth } from "@/app/context/authContext";
import React, { useRef } from "react";

export default function page() {
  const { user, isLoading, signin, signout, error } = useAuth();
  const emailRef = useRef();
  const passwordRef = useRef();

  const handleSignIn = async (e) => {
    e.preventDefault();
    await signin(emailRef.current.value, passwordRef.current.value);
    console.log(error);
    console.log(user);
  };

  return (
    <div className="flex flex-row h-screen p-5">
      {/* First row */}
      <div className="flex flex-col w-100 items-center flex-1 bg-blue-500 rounded-lg">
        <a href="/">
          <h1 className="text-white font-bold mt-5 text-2xl">LOGO</h1>
        </a>
        <div className="w-[80%] mt-10">
          <img src="/images/admin_design.png" alt="admin_design" />
        </div>
        <div className="w-[80%] text-center text-white mt-10">
          <h1>"Shines with it's smooth Integration"</h1>
          <p>
            Effortlessley linking with diverse third-party tools enhance user
            experience through improved efficiency and coordination
          </p>
        </div>
      </div>
      {/* Second row */}
      <div className="flex-1">
        <div className="flex flex-col flex-1 items-center justify-center h-full">
          <h4 className="font-bold text-lg">Sign In</h4>
          <p className="font-semibold text-sm">Sign in your account</p>

          <form
            className="max-w-[350px] w-full"
            noValidate
            onSubmit={handleSignIn}
          >
            <div className="form-group block mt-5 w-full">
              <label className="block text-blue-500 text-sm" htmlFor="email">
                Enter email address
              </label>
              <input
                className="border-2 border-slate-300 rounded-md py-2 px-1 w-full mt-1 text-sm"
                type="email"
                id="email"
                name="email"
                placeholder="Enter your Email"
                ref={emailRef}
              />
            </div>
            <div className="form-group block mt-2 w-full">
              <label className="block text-blue-500 text-sm" htmlFor="pass">
                Password
              </label>
              <input
                className="border-2 border-slate-300 rounded-md py-2 px-1 w-full mt-1 text-sm"
                type="password"
                id="password"
                name="password"
                placeholder="Enter the Password"
                ref={passwordRef}
              />
            </div>

            <LoadinButton type="submit" className="bg-blue-500 text-white rounded-md mt-5 py-2 px-10 w-full min-h-10" loading={isLoading}/>
          </form>
        </div>
      </div>
    </div>
  );
}
