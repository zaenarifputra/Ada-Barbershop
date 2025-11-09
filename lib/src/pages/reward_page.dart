import 'package:flutter/material.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Reward",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

         
            Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage("assets/image/profil.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ahmad Reno",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kapster",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            // CARD BOX
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFE0B2),
                    Color(0xFFFFE0B2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orangeAccent, width: 1),
              ),
              child: Row(
                children: [
                  // Icons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.emoji_events,
                          size: 40, color: Colors.orange),
                      SizedBox(height: 6),
                      Text(
                        "reward akan tersedia setiap 7 hari sekali",
                        style: TextStyle(fontSize: 11, color: Colors.orange),
                      )
                    ],
                  ),
                  const Spacer(),

                  // Number 4
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "4",
                        style: TextStyle(
                          fontSize: 52,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "+3 hari lagi",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Riwayat Reward
            Expanded(
              child: ListView(
                children: [
                  _rewardHistoryCard("November", "#1 Gumilir", "+Rp 100.000"),
                  _rewardHistoryCard("November", "#1 Gumilir", "+Rp 100.000"),
                  _rewardHistoryCard("Oktober", "#5 Jawa", "+Rp 100.000"),
                  _rewardHistoryCard("Oktober", "#5 Jawa", "+Rp 100.000"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _rewardHistoryCard(String month, String outlet, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // kiri
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                outlet,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),

          // kanan
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
