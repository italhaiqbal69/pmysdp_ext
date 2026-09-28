import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summerofcode_ext/Books%20management%20System/updateScreen.dart';

class ReadBooks extends StatefulWidget {
  const ReadBooks({super.key});

  @override
  State<ReadBooks> createState() => _ReadBooksState();
}

class _ReadBooksState extends State<ReadBooks> {
  String searchText = '';
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF171329), Color(0xFF241A3A), Color(0xFF101C2B)],
          ),
        ),
        child: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('books').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFFD6B56D)),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book_rounded,
                        color: const Color(0xFFD6B56D).withValues(alpha: 0.7),
                        size: 60,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'No books found',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              List<QueryDocumentSnapshot> books = snapshot.data!.docs;

              // Automatically create categories from book name/author
              List<String> categories = [
                'All',
                'Fiction',
                'Self Help',
                'Business',
                'Programming',
                'Technology',
                'Science',
                'Biography',
                'History',
                'Fantasy',
                'Other',
              ];

              List<QueryDocumentSnapshot> filteredBooks = books.where((book) {
                String bookName = book['bookName'].toString().toLowerCase();
                String author = book['author'].toString().toLowerCase();

                bool matchesSearch =
                    bookName.contains(searchText.toLowerCase()) ||
                    author.contains(searchText.toLowerCase());

                String detectedCategory = 'Other';

                if (bookName.contains('harry potter') ||
                    bookName.contains('hobbit') ||
                    bookName.contains('lord of the rings') ||
                    bookName.contains('game of thrones') ||
                    bookName.contains('fantasy')) {
                  detectedCategory = 'Fantasy';
                } else if (bookName.contains('atomic habits') ||
                    bookName.contains('self help') ||
                    bookName.contains('7 habits') ||
                    bookName.contains('habit') ||
                    bookName.contains('mindset') ||
                    bookName.contains('psychology')) {
                  detectedCategory = 'Self Help';
                } else if (bookName.contains('rich dad') ||
                    bookName.contains('business') ||
                    bookName.contains('marketing') ||
                    bookName.contains('entrepreneur') ||
                    bookName.contains('finance') ||
                    bookName.contains('startup')) {
                  detectedCategory = 'Business';
                } else if (bookName.contains('flutter') ||
                    bookName.contains('dart') ||
                    bookName.contains('clean code') ||
                    bookName.contains('programming') ||
                    bookName.contains('algorithm') ||
                    bookName.contains('software')) {
                  detectedCategory = 'Programming';
                } else if (bookName.contains('technology') ||
                    bookName.contains('artificial intelligence') ||
                    bookName.contains(' ai ') ||
                    bookName.contains('machine learning') ||
                    bookName.contains('computer')) {
                  detectedCategory = 'Technology';
                } else if (bookName.contains('science') ||
                    bookName.contains('physics') ||
                    bookName.contains('chemistry') ||
                    bookName.contains('biology') ||
                    bookName.contains('mathematics')) {
                  detectedCategory = 'Science';
                } else if (bookName.contains('biography') ||
                    bookName.contains('autobiography') ||
                    bookName.contains('memoir')) {
                  detectedCategory = 'Biography';
                } else if (bookName.contains('history') ||
                    bookName.contains('war') ||
                    bookName.contains('civilization')) {
                  detectedCategory = 'History';
                } else if (bookName.contains('novel') ||
                    bookName.contains('story') ||
                    bookName.contains('fiction')) {
                  detectedCategory = 'Fiction';
                }

                bool matchesCategory =
                    selectedCategory == 'All' ||
                    detectedCategory == selectedCategory;

                return matchesSearch && matchesCategory;
              }).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Library',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.55),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Explore Books',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          child: const Icon(
                            Icons.menu_book_rounded,
                            color: Color(0xFFD6B56D),
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Search
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search books or authors...',
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.40),
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.white70,
                        ),
                        suffixIcon: searchText.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    searchText = '';
                                  });
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white54,
                                ),
                              )
                            : null,
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.10),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                            color: Color(0xFFD6B56D),
                            width: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Categories
                  SizedBox(
                    height: 42,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedCategory == categories[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[index];
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFD6B56D)
                                    : Colors.white.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFD6B56D)
                                      : Colors.white.withValues(alpha: 0.08),
                                ),
                              ),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.60),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 22),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          '${filteredBooks.length} Books',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        if (selectedCategory != 'All')
                          Text(
                            selectedCategory,
                            style: const TextStyle(
                              color: Color(0xFFD6B56D),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: filteredBooks.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off_rounded,
                                  color: Colors.white.withValues(alpha: 0.35),
                                  size: 55,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'No books found',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.55),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Try another search or category.',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.35),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 25),
                            itemCount: filteredBooks.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 18,
                                  childAspectRatio: 0.59,
                                ),
                            itemBuilder: (context, index) {
                              final book = filteredBooks[index];

                              String image = book['image'].toString();
                              String bookName = book['bookName'].toString();
                              String author = book['author'].toString();
                              String price = book['price'].toString();

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.07),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Image.network(
                                            image,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    color: const Color(
                                                      0xFF302642,
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.menu_book_rounded,
                                                        color: Color(
                                                          0xFFD6B56D,
                                                        ),
                                                        size: 45,
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bookName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                height: 1.2,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                            const SizedBox(height: 6),

                                            Text(
                                              author,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white.withValues(
                                                  alpha: 0.48,
                                                ),
                                                fontSize: 12,
                                              ),
                                            ),

                                            const SizedBox(height: 10),

                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.payments_outlined,
                                                  color: Color(0xFFD6B56D),
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 5),

                                                Expanded(
                                                  child: Text(
                                                    '\$$price',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Color(0xFFD6B56D),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),

                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => Updatescreen(
                                                          image: snapshot
                                                              .data!
                                                              .docs[index]['image']
                                                              .toString(),
                                                          bookName: snapshot
                                                              .data!
                                                              .docs[index]['bookName']
                                                              .toString(),
                                                          author: snapshot
                                                              .data!
                                                              .docs[index]['author']
                                                              .toString(),
                                                          price: snapshot
                                                              .data!
                                                              .docs[index]['price'],
                                                          docId: snapshot
                                                              .data!
                                                              .docs[index]
                                                              .id,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFFD6B56D,
                                                      ).withValues(alpha: 0.12),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            9,
                                                          ),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      color: Color(0xFFD6B56D),
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
