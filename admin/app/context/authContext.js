"use client";

import { createContext, useContext, useState } from "react";

const AuthContext = createContext(undefined);

export function Authprovider({ children }) {
  const [user, setUser] = useState(undefined);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const signin = async (email, password) => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch("http://localhost:4000/signin", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          email,
          password,
        }),
      });
      if (!response.ok) {
        throw new Error("Login failed");
      }
      const userData = await response.json();
      setUser(userData);
      localStorage.setItem("token", userData.token);
    } catch (error) {
      setError(error.message || "An error occured");
    } finally {
      setIsLoading(false);
    }
  };

  const signout = async () => {
    setIsLoading(true);
    try {
      localStorage.removeItem("token");
      setUser(null);
    } catch (error) {
      setError(error.message || "Logout failed");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <AuthContext.Provider value={{ user, isLoading, error, signin, signout }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("use Auth must be used within auth provider");
  }

  return context;
};
