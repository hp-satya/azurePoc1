export const getSum = async (data) => {
  try {
    const result = await fetch("http://localhost:4000/sum", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    });

    const response = await result.json();
    return response?.sum;
  } catch (error) {
    throw new Error(error.message || "Failed to get sum");
  }
};
