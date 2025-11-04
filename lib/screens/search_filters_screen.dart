import 'package:flutter/material.dart';
import 'package:parkshare/utils/app_theme.dart';

class SearchFiltersScreen extends StatefulWidget {
  const SearchFiltersScreen({super.key});

  @override
  State<SearchFiltersScreen> createState() => _SearchFiltersScreenState();
}

class _SearchFiltersScreenState extends State<SearchFiltersScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Filter options
  RangeValues _priceRange = const RangeValues(0, 20);
  double _maxDistance = 5.0;
  String _sortBy = 'Distance';

  // Spot type filters
  bool _outdoorSpots = true;
  bool _coveredSpots = true;
  bool _garageSpots = true;
  bool _streetSpots = false;

  // Amenity filters
  final List<String> _selectedAmenities = [];
  final List<Map<String, dynamic>> _amenities = [
    {'icon': Icons.ev_station, 'name': 'EV Charging'},
    {'icon': Icons.security, 'name': 'Security'},
    {'icon': Icons.videocam, 'name': 'CCTV'},
    {'icon': Icons.light_mode, 'name': 'Well-lit'},
    {'icon': Icons.wheelchair_pickup, 'name': 'Accessible'},
    {'icon': Icons.umbrella, 'name': 'Covered'},
  ];

  // Availability filters
  bool _availableNow = false;
  TimeOfDay? _availableFrom;
  TimeOfDay? _availableUntil;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Search & Filters'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by location, address...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) => setState(() {}),
                ),

                const SizedBox(height: 24),

                // Price Range
                _buildSectionTitle('Price Range (per hour)'),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${_priceRange.start.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryBlue,
                              ),
                            ),
                            Text(
                              '\$${_priceRange.end.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: _priceRange,
                          min: 0,
                          max: 50,
                          divisions: 50,
                          activeColor: AppTheme.primaryBlue,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _priceRange = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Distance
                _buildSectionTitle('Maximum Distance'),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_maxDistance.toStringAsFixed(1)} miles',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                        Slider(
                          value: _maxDistance,
                          min: 0.5,
                          max: 20,
                          divisions: 39,
                          activeColor: AppTheme.primaryBlue,
                          onChanged: (double value) {
                            setState(() {
                              _maxDistance = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Sort By
                _buildSectionTitle('Sort By'),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      _buildRadioTile('Distance', 'Nearest first'),
                      const Divider(height: 1),
                      _buildRadioTile('Price (Low to High)', 'Cheapest first'),
                      const Divider(height: 1),
                      _buildRadioTile('Price (High to Low)', 'Most expensive first'),
                      const Divider(height: 1),
                      _buildRadioTile('Rating', 'Highest rated first'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Spot Type
                _buildSectionTitle('Spot Type'),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      _buildCheckboxTile(
                        'Outdoor',
                        _outdoorSpots,
                        (value) => setState(() => _outdoorSpots = value!),
                      ),
                      const Divider(height: 1),
                      _buildCheckboxTile(
                        'Covered',
                        _coveredSpots,
                        (value) => setState(() => _coveredSpots = value!),
                      ),
                      const Divider(height: 1),
                      _buildCheckboxTile(
                        'Garage',
                        _garageSpots,
                        (value) => setState(() => _garageSpots = value!),
                      ),
                      const Divider(height: 1),
                      _buildCheckboxTile(
                        'Street',
                        _streetSpots,
                        (value) => setState(() => _streetSpots = value!),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Amenities
                _buildSectionTitle('Amenities'),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _amenities.map((amenity) {
                        final isSelected =
                            _selectedAmenities.contains(amenity['name']);
                        return FilterChip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                amenity['icon'] as IconData,
                                size: 18,
                                color: isSelected
                                    ? Colors.white
                                    : AppTheme.primaryBlue,
                              ),
                              const SizedBox(width: 8),
                              Text(amenity['name'] as String),
                            ],
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedAmenities.add(amenity['name'] as String);
                              } else {
                                _selectedAmenities.remove(amenity['name']);
                              }
                            });
                          },
                          selectedColor: AppTheme.primaryBlue,
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppTheme.primaryBlue,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Availability
                _buildSectionTitle('Availability'),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('Available Now'),
                        subtitle: const Text('Show only spots available right now'),
                        value: _availableNow,
                        onChanged: (value) {
                          setState(() {
                            _availableNow = value!;
                          });
                        },
                        activeColor: AppTheme.primaryBlue,
                      ),
                      const Divider(height: 1),
                      ListTile(
                        title: const Text('Available From'),
                        subtitle: Text(
                          _availableFrom?.format(context) ?? 'Any time',
                        ),
                        trailing: const Icon(Icons.access_time),
                        onTap: () => _selectTime(context, true),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        title: const Text('Available Until'),
                        subtitle: Text(
                          _availableUntil?.format(context) ?? 'Any time',
                        ),
                        trailing: const Icon(Icons.access_time),
                        onTap: () => _selectTime(context, false),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),

          // Apply Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and return to previous screen
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filters applied!'),
                      backgroundColor: AppTheme.successColor,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppTheme.textPrimary,
      ),
    );
  }

  Widget _buildRadioTile(String value, String subtitle) {
    return RadioListTile<String>(
      title: Text(value),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
      ),
      value: value,
      groupValue: _sortBy,
      onChanged: (String? newValue) {
        setState(() {
          _sortBy = newValue!;
        });
      },
      activeColor: AppTheme.primaryBlue,
    );
  }

  Widget _buildCheckboxTile(
    String title,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: AppTheme.primaryBlue,
    );
  }

  Future<void> _selectTime(BuildContext context, bool isFrom) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          _availableFrom = picked;
        } else {
          _availableUntil = picked;
        }
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _searchController.clear();
      _priceRange = const RangeValues(0, 20);
      _maxDistance = 5.0;
      _sortBy = 'Distance';
      _outdoorSpots = true;
      _coveredSpots = true;
      _garageSpots = true;
      _streetSpots = false;
      _selectedAmenities.clear();
      _availableNow = false;
      _availableFrom = null;
      _availableUntil = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filters reset!'),
      ),
    );
  }
}
