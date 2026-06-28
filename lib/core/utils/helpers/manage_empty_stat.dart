String getEmptyMessage(String title) {
  return switch (title) {
    'Total Earnings' => 'There are no earnings yet.',
    'Total Orders' => 'There are no orders yet.',
    'Pending Orders' => 'There are no pending orders.',
    'Completed Orders' => 'There are no completed orders.',
    _ => 'There is no data available.',
  };
}