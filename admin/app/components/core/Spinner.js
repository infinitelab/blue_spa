"use client";
import styled, { keyframes } from "styled-components";

const loadingSpinner = keyframes`
  from {
    transform: rotate(0turn);
  }
  to {
    transform: rotate(1turn);
  }
`;

const StyledSpinner = styled.div`
  text-align: center;
  position: relative;
  width: 16px;
  height: 16px;
  border: 4px solid transparent;
  border-top-color: #ffffff;
  border-radius: 50%;
  animation: ${loadingSpinner} 1s ease infinite;
`;

const Spinner = () => {
  return (
    <div className="flex items-center justify-center h-full w-full">
      <StyledSpinner /> 
    </div>
  );
};

export default Spinner;