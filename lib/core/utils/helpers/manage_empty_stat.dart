String getEmptyMessage(String title) {
  return switch (title) {
    'Total Earnings' =>
      'No earnings yet. Start selling to earn revenue.',

    'Total Orders' =>
      'No orders available.',

    'Pending Orders' =>
      'No pending orders at the moment.',

    'Completed Orders' =>
      'No completed orders yet.',

    _ =>
      'No data available.',
  };
}