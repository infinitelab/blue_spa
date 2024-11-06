"use client";

import Spinner from "./Spinner";

function LoadinButton({
  varient = "primary",
  label = "submit",
  loading = false,
  children,
  ...props
}) {
  return (
    <button {...props} disabled={loading}>
      {!loading ? label : <Spinner />}
    </button>
  );
}

export default LoadinButton;
