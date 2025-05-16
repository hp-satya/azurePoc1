import React, { useState } from "react";
import { getSum } from "./services/sum-service";

function Sum() {
  const [num1, setNum1] = useState("");
  const [num2, setNum2] = useState("");
  const [sum, setSum] = useState(null);
  const [error, setError] = useState("");

  const handleInputChange = (e, setNumber) => {
    const value = e.target.value;

    if (!value || /^[0-9]*$/.test(value)) {
      setError("");
      setNumber(value);
    } else {
      setError("Only numbers are allowed!");
    }
  };

  const calculateSum = async () => {
    if (num1 === "" || num2 === "") {
      setError("Both inputs are required!");
      return;
    }
    const response = await getSum({
      num1: parseInt(num1),
      num2: parseInt(num2),
    });

    if (!response) {
      setError("error in response!");
      return;
    }
    setSum(response);
    setError("");
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-100">
      <h1 className="text-3xl font-bold text-blue-600 mb-6">
        Sum of Two Numbers
      </h1>
      <div className="bg-white p-6 rounded-lg shadow-md">
        <div className="mb-4">
          <label className="block text-gray-700 font-medium mb-2">
            Number 1:
          </label>
          <input
            type="text"
            value={num1}
            onChange={(e) => handleInputChange(e, setNum1)}
            className="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <div className="mb-4">
          <label className="block text-gray-700 font-medium mb-2">
            Number 2:
          </label>
          <input
            type="text"
            value={num2}
            onChange={(e) => handleInputChange(e, setNum2)}
            className="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        {error && <p className="text-red-500 mb-4">{error}</p>}
        <button
          onClick={calculateSum}
          className="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition"
        >
          Calculate Sum
        </button>
        {sum !== null && (
          <p className="mt-4 text-green-600 font-medium">Sum: {sum}</p>
        )}
      </div>
    </div>
  );
}

export default Sum;
