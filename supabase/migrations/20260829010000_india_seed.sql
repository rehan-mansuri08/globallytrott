-- GlobeTrotter: India geo-hierarchy seed (states/UTs + curated destinations)
-- Idempotent: safe to re-run. Mirrors the scalable World->Country->State->City model.

-- ============ REGIONS: Indian States & Union Territories ============
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Andhra Pradesh', 'andhra_pradesh', 'AP', 'Amaravati', 'Coastal southern state of temples, hills and the Krishna-Godavari deltas.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Arunachal Pradesh', 'arunachal_pradesh', 'AR', 'Itanagar', 'Himalayan frontier of misty valleys, monasteries and tribal cultures.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Assam', 'assam', 'AS', 'Dispur', 'Tea gardens, the Brahmaputra, one-horned rhinos and warm hospitality.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Bihar', 'bihar', 'BR', 'Patna', 'Land of Bodh Gaya''s enlightenment and ancient Pataliputra.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Chhattisgarh', 'chhattisgarh', 'CG', 'Raipur', 'Waterfall-dotted central state of tribal heritage and dense forests.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Goa', 'goa', 'GA', 'Panaji', 'Sun-drenched beaches, Portuguese heritage and laid-back river life.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Gujarat', 'gujarat', 'GJ', 'Gandhinagar', 'Wide salt deserts, wild lions, craft villages and the western coast.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Haryana', 'haryana', 'HR', 'Chandigarh', 'North Indian heartland of history, wetlands and farmlands.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Himachal Pradesh', 'himachal_pradesh', 'HP', 'Shimla', 'Pine-clad Himalayan hill country of trekking trails and rivers.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Jharkhand', 'jharkhand', 'JH', 'Ranchi', 'Forest plateau of falls, hills and tribal arts.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Karnataka', 'karnataka', 'KA', 'Bengaluru', 'Palace cities, ancient ruins of Hampi, coffee hills and beaches.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Kerala', 'kerala', 'KL', 'Thiruvananthapuram', 'Backwaters, spice plantations, hill stations and tropical coast.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Madhya Pradesh', 'madhya_pradesh', 'MP', 'Bhopal', 'The heart of India — forests, forts, temples and wildlife.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Maharashtra', 'maharashtra', 'MH', 'Mumbai', 'Cosmopolitan coast, Sahyadri ghats, caves and hill retreats.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Manipur', 'manipur', 'MN', 'Imphal', 'Lush valley state of the Loktak lake and classical dance.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Meghalaya', 'meghalaya', 'ML', 'Shillong', 'Abode of clouds — wettest places, living root bridges, pine hills.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Mizoram', 'mizoram', 'MZ', 'Aizawl', 'Blue-green ridges and rivers of the eastern frontier.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Nagaland', 'nagaland', 'NL', 'Kohima', 'Warrior tribal state of the Hornbill festival and rugged peaks.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Odisha', 'odisha', 'OD', 'Bhubaneswar', 'Temple city fields, sacred Konark sun wheel and quiet coasts.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Punjab', 'punjab', 'PB', 'Chandigarh', 'Golden Temple city, fertile fields and a hearty food culture.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Rajasthan', 'rajasthan', 'RJ', 'Jaipur', 'The royal desert state of forts, palaces, dunes and vibrant fairs.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Sikkim', 'sikkim', 'SK', 'Gangtok', 'Himalayan kingdom of monasteries, peaks and rhododendron forests.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Tamil Nadu', 'tamil_nadu', 'TN', 'Chennai', 'Dravidian temples, hill stations and the Coromandel coast.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Telangana', 'telangana', 'TG', 'Hyderabad', 'Biryanis, lake-side gardens and Qutb Shahi heritage.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Tripura', 'tripura', 'TR', 'Agartala', 'Northeastern state of royal palaces and lush hills.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Uttar Pradesh', 'uttar_pradesh', 'UP', 'Lucknow', 'The Taj Mahal, ghats of Varanasi and the vast Gangetic plains.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'Uttarakhand', 'uttarakhand', 'UK', 'Dehradun', 'Land of gods, Himalayan char dham and alpine adventure.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'state', 'West Bengal', 'west_bengal', 'WB', 'Kolkata', 'Himalayan Darjeeling, mangrove Sundarbans and cultural Kolkata.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'state')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Andaman & Nicobar Islands', 'andaman_nicobar', 'AN', 'Port Blair', 'Crystal islands of turquoise water, coral reefs and rainforest.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Chandigarh', 'chandigarh', 'CH', 'Chandigarh', 'Le Corbusier''s planned garden city on the Punjab-Haryana border.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Dadra & Nagar Haveli and Daman & Diu', 'dadra_nagar_daman_diu', 'DN', 'Daman', 'Sunny western coast towns and riverside interiors.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Delhi', 'delhi', 'DL', 'New Delhi', 'Seven cities of empire — Red Fort, Qutub, markets and modern India.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Jammu & Kashmir', 'jammu_kashmir', 'JK', 'Srinagar', 'Snow peaks, lakes, tulip gardens and Himalayan meadows.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Ladakh', 'ladakh', 'LA', 'Leh', 'High-altitude moonscapes, monasteries and world-class high passes.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Lakshadweep', 'lakshadweep', 'LD', 'Kavaratti', 'A coral atoll archipelago of startlingly clear lagoons.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;
INSERT INTO public.regions (parent_id, kind, name, slug, code, capital, summary, best_seasons, tags, latitude, longitude, sort)
SELECT id, 'union_territory', 'Puducherry', 'puducherry', 'PY', 'Pondicherry', 'French colonial quarter, Auroville and a calm Coromandel coast.', ARRAY['winter','spring','summer','monsoon','autumn'], ARRAY['travel','india'], NULL, NULL, 10 + (SELECT count(*) FROM public.regions r2 WHERE r2.kind = 'union_territory')
FROM public.regions WHERE kind = 'country' AND slug = 'india'
ON CONFLICT (kind, slug) DO NOTHING;

-- ============ DESTINATIONS (curated first tranche) ============
-- ---- Gulmarg (jammu_kashmir) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Gulmarg', 'gulmarg', 'destination', 'India''s premier ski bowl set in alpine conifer meadows at 2,690 m.', 'A bowl of rolling alpine meadows ringed by the Apharwat ridge. Reachable by road from Srinagar (52 km); the Gulmarg Gondola, one of the highest cable cars in the world, lifts skiers to 3,979 m in two phases.', 34.0489, 74.3811, 2690, ARRAY['Adventure', 'Skiing & Snowboarding', 'Meadows & Alpine Vistas', 'Gondola Rides'], ARRAY['Snow', 'Winter', 'Summer Blooms', 'Sunny'], ARRAY[12, 1, 2, 3, 5, 6, 7, 8], '2-3 days', 'Luxury', 88, false, ARRAY['Wazwan', 'Kahwa', 'Rogan Josh'], ARRAY['Gulmarg Winter Festival', 'Synchronised Skiing Championship'], ARRAY['Phase II Gondola ride to Kangdori', 'Ski/snowboard lessons', 'Snow-biking & zorbing', 'Golf at one of the world''s highest courses']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'jammu_kashmir'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Deep Snow', ARRAY[12, 1, 2], 'Heavy snowfall, temperatures -12C to -2C.', ARRAY['Skiing', 'Snowboarding', 'Snow photography'], 'High', 'Luxury', 'Excellent', 'Powder season; check gondola phase-II weather conditions.', 1
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring Bloom', ARRAY[3, 4, 5], 'Melting snow, crisp air, flowers returning.', ARRAY['Golf', 'Treks', 'Hiking'], 'Medium', 'Moderate', 'Great', 'Best for avoiding crowds at a lower price.', 2
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Meadows', ARRAY[6, 7, 8], 'Mild and pleasant, 10C-24C.', ARRAY['Pony rides', 'Meadow walks', 'Picnics'], 'High', 'Moderate', 'Great', 'Peak family season; snow gone above treeline except Apharwat.', 3
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Skiing & Snowboarding', 'Slopes served by gondola phase I and II with rentals and instructors on-site.', 'snowflake', 'Adventure', ARRAY['any'], ARRAY[12, 1, 2], false, ARRAY['snow', 'freezing', 'clear'], 1
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gondola Phase II Ride', 'Dramatic ride from Kongdori to 3,979 m above the valley.', 'cable', 'Adventure', ARRAY['any'], ARRAY[12, 1, 2, 3, 5, 6, 7, 8], false, ARRAY['snow', 'clear'], 2
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Golf at Gulmarg', 'One of the highest golf courses in the world set in meadow surroundings.', 'golf', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 3
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Snow Photography', 'Frosted pines and blue-hour light over the Apharwat range.', 'camera', 'Photography', ARRAY['any'], ARRAY[12, 1, 2], false, ARRAY['snow', 'clear'], 4
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gulmarg+Meadows', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gulmarg+Meadows', 'Gulmarg valley meadows', 'Placeholder', 'CC0', NULL, NULL, 'landscape', 1
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Gulmarg+Gondola', 'https://placehold.co/900x600/334155/e2e8f0?text=Gulmarg+Gondola', 'Gulmarg gondola over snow', 'Placeholder', 'CC0', NULL, NULL, 'winter', 2
FROM public.destinations d WHERE d.slug = 'gulmarg'
ON CONFLICT DO NOTHING;

-- ---- Srinagar (jammu_kashmir) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Srinagar', 'srinagar', 'destination', 'Houseboats, Dal Lake shikaras and Mughal gardens in the Kashmir Valley.', 'The summer capital of Jammu & Kashmir, served by Srinagar airport (12 km) with direct flights from major metros. The walled old city, Mughal gardens and Dal Lake define a city as romantic as it is historic.', 34.0837, 74.7973, 1585, ARRAY['Heritage', 'Spiritual', 'Leisure', 'Culinary'], ARRAY['Spring', 'Autumn', 'Summer', 'Crisp Winter'], ARRAY[4, 5, 6, 7, 8, 9, 10, 11], '2-3 days', 'Moderate', 86, false, ARRAY['Wazwan', 'Kahwa', 'Bakarkhani'], ARRAY['Tulip Festival', 'Shikara Festival'], ARRAY['Sunrise shikara ride on Dal Lake', 'Houseboat stay', 'Tulip garden visit in April', 'Wazwan dinner']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'jammu_kashmir'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Tulip Spring', ARRAY[3, 4, 5], 'Blossoms and a mild 10C-22C.', ARRAY['Shikara rides', 'Garden walks', 'City tours'], 'Medium', 'Moderate', 'Great', 'Peak tulip display in April.', 1
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[6, 7, 8], 'Pleasant 15C-30C with evening lake breezes.', ARRAY['Houseboating', 'Mughal gardens', 'Char Minar'], 'High', 'Moderate', 'Great', 'High season; book boats early.', 2
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Golden Autumn', ARRAY[9, 10, 11], 'Chinar trees blaze gold in crisp air.', ARRAY['Old city walks', 'Photography', 'Apple picking'], 'Medium', 'Moderate', 'Excellent', 'Best photography months.', 3
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dawn Shikara Ride', 'Glide past floating vegetable gardens and lotus beds as the sun rises over Zabarwan hills.', 'boat', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 7, 8, 9, 10, 11], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mughal Garden Traversals', 'Terraced gardens of Nishat, Shalimar and Chashma Shahi.', 'palmtree', 'Heritage', ARRAY['any'], ARRAY[3, 4, 5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Houseboat Stay', 'Overnight aboard a walnut-carved houseboat with local cuisine.', 'home', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 7, 8, 9, 10], false, ARRAY['clear', 'rainy'], 3
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Heritage Wazwan Dinner', 'A ceremonial Kashmiri multi-course feast in the old city.', 'utensils', 'Culinary', ARRAY['any'], ARRAY[4, 5, 6, 7, 8, 9, 10], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Srinagar+Dal+Lake', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Srinagar+Dal+Lake', 'Dal Lake houseboats', 'Placeholder', 'CC0', NULL, NULL, 'landscape', 1
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Shalimar+Gardens', 'https://placehold.co/900x600/334155/e2e8f0?text=Shalimar+Gardens', 'Shalimar Mughal gardens', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'srinagar'
ON CONFLICT DO NOTHING;

-- ---- Pahalgam (jammu_kashmir) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Pahalgam', 'pahalgam', 'destination', 'River-side meadows at the head of the Lidder Valley — base for the Amarnath Yatra.', 'Green meadows flanking the Lidder river, 95 km from Srinagar airport. Acts as the base camp for the Amarnath cave pilgrimage each summer and a peaceful base for horse treks to Baisaran and Aru.', 34.0399, 75.2616, 2740, ARRAY['Adventure', 'Meadows', 'Pilgrimage', 'Trekking'], ARRAY['Summer', 'Autumn', 'Winter'], ARRAY[5, 6, 7, 8, 9, 10], '2-3 days', 'Moderate', 72, false, ARRAY['Kahwa', 'Trout curry', 'Rogan Josh'], ARRAY['Betaab Valley Festival', 'Amarnath Yatra'], ARRAY['Horse trek to Baisaran meadow', 'Trout fishing in the Lidder', 'Angling permits', 'Betaab valley picnic']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'jammu_kashmir'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Yatra Summer', ARRAY[7, 8], 'Pilgrim season; pleasant 8C-24C.', ARRAY['Amarnath base', 'Horse treks', 'River walks'], 'High', 'Moderate', 'Good', 'Crowded near the yatra corridor.', 1
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Meadow Autumn', ARRAY[9, 10], 'Crisp golden light over the river.', ARRAY['Treks', 'Photography', 'Trout fishing'], 'Low', 'Budget', 'Excellent', 'Quiet and transparently beautiful.', 2
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Snow', ARRAY[12, 1, 2], 'Snowbound, quiet, sub-zero nights.', ARRAY['Snow trails', 'Fire-side stays'], 'Low', 'Budget', 'Good', 'Many dhabas close; check road conditions.', 3
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Horse Trek to Baisaran', 'The ''mini Switzerland'' meadow above Pahalgam with panoramic valley views.', 'horse', 'Adventure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Betaab Valley Picnic', 'Film-set green valley accessible by shared cabs.', 'tree-pine', 'Leisure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Trout Angling', 'Licensed river fishing on the Lidder.', 'fish', 'Adventure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Amarnath Yatra Base', 'Access point for the cave shrine (July-August, registration required).', 'church', 'Spiritual', ARRAY['any'], ARRAY[7, 8], false, ARRAY['clear', 'rainy'], 4
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pahalgam+Lidder', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pahalgam+Lidder', 'Lidder river at Pahalgam', 'Placeholder', 'CC0', NULL, NULL, 'landscape', 1
FROM public.destinations d WHERE d.slug = 'pahalgam'
ON CONFLICT DO NOTHING;

-- ---- Leh (ladakh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Leh', 'leh', 'destination', 'High-desert capital of Ladakh under the Stok Kangri range.', 'Ladakh''s gateway at 3,500 m, reached by Kushok Bakula Rimpochee airport or the Manali/ Srinagar highways. Expect Buddhist monasteries, the Leh Palace and dramatic driving passes on every side.', 34.1526, 77.5771, 3500, ARRAY['Adventure', 'Monasteries', 'High Altitude', 'Photography'], ARRAY['Summer', 'Crisp Autumn', 'Winter'], ARRAY[5, 6, 7, 8, 9], '2-3 days', 'Moderate', 82, false, ARRAY['Thukpa', 'Momos', 'Butter tea'], ARRAY['Hemis Festival', 'Ladakh Festival'], ARRAY['Thiksey monastery sunrise', 'Khardung La pass drive', 'Shanti Stupa walk', 'Nubra valley excursion']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'ladakh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Adventure', ARRAY[6, 7, 8], 'Oxygen-thin but sunny; 5C-25C.', ARRAY['Monastery hops', 'Pass drives', 'Trekking'], 'High', 'Moderate', 'Great', 'Roads open; book inner-line permits.', 1
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Golden Autumn', ARRAY[9, 10], 'Chill air with gin-clear views.', ARRAY['Photography', 'Trekking', 'Village stays'], 'Medium', 'Moderate', 'Excellent', 'Thinner crowds after August.', 2
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Closed Winter', ARRAY[11, 12, 1, 2], 'Below -20C at night; roads mostly closed.', ARRAY['Winters in Ladakh', 'Local life tours'], 'Low', 'Budget', 'Good', 'Only for the prepared; connectivity cut.', 3
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Thiksey Gompa Sunrise', 'Monastery backdropped by the Indus valley peaks with early light.', 'sunrise', 'Spiritual', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Khardung La Drive', 'Drive onto one of the world''s highest motorable passes.', 'car', 'Adventure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9, 10], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Hemis Festival', 'June mask-dance festival at Ladakh''s largest monastery.', 'mask', 'Cultural', ARRAY['any'], ARRAY[6, 7], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Magnetic Hill & Hall of Fame', 'Quirky roadside optical illusion and a mountain-war memorial.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[5, 6, 7, 8, 9, 10], false, ARRAY['clear', 'sunny'], 4
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Leh+Palace', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Leh+Palace', 'Leh Palace on the ridge', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Thiksey+Monastery', 'https://placehold.co/900x600/334155/e2e8f0?text=Thiksey+Monastery', 'Thiksey monastery above the Indus', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 2
FROM public.destinations d WHERE d.slug = 'leh'
ON CONFLICT DO NOTHING;

-- ---- Nubra Valley (ladakh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Nubra Valley', 'nubra_valley', 'destination', 'A hidden gem of sand dunes, cold desert bactrian camels and twin continental rivers.', 'Reached over the Khardung La, Nubra''s Indus-Shyok confluence creates a cold desert of dunes and apricot orchards. Permits required; stay in Hunder or Diskit.', 34.615, 77.563, 3050, ARRAY['Offbeat', 'Adventure', 'Desert', 'Photography'], ARRAY['Summer', 'Autumn', 'Winter'], ARRAY[6, 7, 8, 9], '2-3 days', 'Moderate', 64, true, ARRAY['Apricot jam', 'Sea buckthorn tea', 'Momos'], ARRAY['Diskit Festival', 'Yarab Tsho Festival'], ARRAY['Bactrian camel ride on Hunder dunes', 'Diskit monastery statue', 'Hot springs of Panamik', 'Yarab Tsho lake trek']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'ladakh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Trek Season', ARRAY[6, 7, 8], 'Cool and sunny with warm dunes.', ARRAY['Camel rides', 'Monastery visits', 'Hot springs'], 'Medium', 'Moderate', 'Great', 'Permits and four-wheel drive essential.', 1
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10], 'Clear skies, apricot harvest.', ARRAY['Village walks', 'Photography'], 'Low', 'Moderate', 'Excellent', 'Beautifully quiet.', 2
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Isolation', ARRAY[11, 12, 1], 'Khardung La closed; valley snowed in.', ARRAY['Local life'], 'Very Low', 'Budget', 'Fair', 'Not recommended for first-timers.', 3
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bactrian Camel Dune Ride', 'Two-humped camels on the Hunder sand dunes, a cold-desert oddity.', 'camel', 'Adventure', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Diskit Gompas', 'Hilltop monastery housing the giant Maitreya statue overlooking the valley.', 'church', 'Spiritual', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Panamik Hot Springs', 'Sulphur springs tucked at the head of Nubra.', 'thermometer', 'Leisure', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Nubra+Dunes', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Nubra+Dunes', 'Hunder sand dunes in Nubra', 'Placeholder', 'CC0', NULL, NULL, 'desert', 1
FROM public.destinations d WHERE d.slug = 'nubra_valley'
ON CONFLICT DO NOTHING;

-- ---- Manali (himachal_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Manali', 'manali', 'destination', 'The classic Kullu Valley adventure town at the foot of Rohtang Pass.', 'A lively two-kilometre riverside town in the Kullu Valley, 48 km from Kullu-Bhuntar airport and connected by deluxe Volvos from Delhi. Base for Solang valley adventure sports and the Rohtang/Atal tunnel road to Lahaul.', 32.2432, 77.1892, 2050, ARRAY['Adventure', 'River Rafting', 'Skiing', 'Mountain Town'], ARRAY['Winter Snow', 'Spring', 'Monsoon Green', 'Autumn'], ARRAY[1, 2, 3, 4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 84, false, ARRAY['Siddu', 'Kullu trout', 'Himachali thali'], ARRAY['Winter Carnival', 'Hadimba Devi Fair'], ARRAY['Solang Valley paragliding/skiing', 'Old Manali cafes', 'Hadimba temple', 'Atal tunnel to Lahaul']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'himachal_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Snow', ARRAY[12, 1, 2], 'Snow down to town level; -5C to 8C.', ARRAY['Solang skiing', 'Snow activities', 'Cafes'], 'High', 'Moderate', 'Great', 'Festive crowds from New Year.', 1
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4, 5], 'Blossoms and pleasant 8C-22C.', ARRAY['Paragliding', 'Trekking', 'River rafting'], 'Medium', 'Budget', 'Great', 'Best value window.', 2
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Slip', ARRAY[7, 8], 'Landslide-prone, heavy rain.', ARRAY['Cafes', 'Spa retreats', 'Indoor sessions'], 'Low', 'Budget', 'Fair', 'Roads can close; keep buffers.', 3
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Crisp, clear and golden.', ARRAY['Trekking', 'Photography', 'Camping'], 'Medium', 'Moderate', 'Excellent', 'Best overall season.', 4
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Solang Valley Adventures', 'Paragliding, zorbing, quad biking and an aerial ropeway 14 km from Manali.', 'globe', 'Adventure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Skiing at Solang', 'Snow-slope skiing and lessons during the winter months.', 'snowflake', 'Adventure', ARRAY['any'], ARRAY[12, 1, 2], false, ARRAY['snow', 'clear'], 2
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'River Rafting on the Beas', 'Rapids between Pirdi and Jhiri as the snow melts.', 'waves', 'Adventure', ARRAY['any'], ARRAY[5, 6, 9, 10], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Old Manali Café Circuit', 'Rooftop cafes over the Beas run by backpacker culture since the 70s.', 'coffee', 'Leisure', ARRAY['any'], ARRAY[1, 2, 3, 4, 5, 6, 9, 10, 11, 12], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Manali+Valley', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Manali+Valley', 'Kullu valley from Manali', 'Placeholder', 'CC0', NULL, NULL, 'landscape', 1
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Solang+Valley', 'https://placehold.co/900x600/334155/e2e8f0?text=Solang+Valley', 'Solang adventure valley', 'Placeholder', 'CC0', NULL, NULL, 'adventure', 2
FROM public.destinations d WHERE d.slug = 'manali'
ON CONFLICT DO NOTHING;

-- ---- Shimla (himachal_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Shimla', 'shimla', 'destination', 'The colonial summer capital on a pine ridge above the Sutlej valley.', 'Reachable by the Kalka-Shimla heritage toy train or road from Chandigarh (113 km). Mall Road, the Ridge, Victorian cottages and snow views define this former summer capital of British India.', 31.1048, 77.1734, 2200, ARRAY['Heritage', 'Colonial', 'Hill Station', 'Shopping'], ARRAY['Summer', 'Monsoon', 'Winter Snow', 'Spring'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 74, false, ARRAY['Siddu', 'Momos', 'Chana madra'], ARRAY['Summer Festival', 'Ice Skating Carnival'], ARRAY['Morning Mall Road walk', 'Toy train descent to Kalka', 'Kufri & Jakhoo viewpoint', 'Gaiety theatre shows']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'himachal_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Retreat', ARRAY[4, 5, 6], 'Cool 12C-25C escape from plains heat.', ARRAY['Mall walks', 'Kufri', 'Heritage tours'], 'High', 'Moderate', 'Great', 'School-vacation crowds.', 1
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Rainy with forest mists.', ARRAY['Cafes', 'Gaiety theatre', 'Shopping'], 'Low', 'Budget', 'Fair', 'Trails muddy.', 2
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Snow', ARRAY[12, 1, 2], 'Snow showers and clear ridge views.', ARRAY['Snow walks', 'Ridge sunsets', 'Toy train'], 'Medium', 'Moderate', 'Good', 'Carry warm layers.', 3
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Daffodils and cherry blossoms in the parks.', ARRAY['Garden walks', 'Photography'], 'Low', 'Budget', 'Excellent', 'Quiet and fresh.', 4
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kalka-Shimla Toy Train', 'UNESCO-listed narrow-gauge ride through 102 tunnels and snowfall pines.', 'train', 'Heritage', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], true, ARRAY['any'], 1
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ridge & Mall Road Stroll', 'Pedestrian spine of colonial Shimla with Himalaya views.', 'walk', 'Leisure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jakhoo Temple Viewpoint', 'Highest point in town with a giant Hanuman statue and monkey residents.', 'landmark', 'Spiritual', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ice Skating Rink', 'One of Asia''s largest natural outdoor rinks, open in deep winter.', 'snowflake', 'Adventure', ARRAY['any'], ARRAY[12, 1], false, ARRAY['freezing', 'clear'], 4
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Shimla+Ridge', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Shimla+Ridge', 'Shimla Ridge at dusk', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'shimla'
ON CONFLICT DO NOTHING;

-- ---- Dharamshala (himachal_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Dharamshala', 'dharamshala', 'destination', 'Tibetan exile capital and misty Kangra valley hill town.', 'Home of His Holiness the Dalai Lama, with an hour''s drive from Kangra airport under the Dhauladhar peaks. McLeod Ganj, the Namgyal monastery, trekking and a rich tea culture anchor the town.', 32.219, 76.3234, 1457, ARRAY['Spiritual', 'Tibetan Culture', 'Trekking', 'Mist & Pines'], ARRAY['Spring', 'Summer', 'Monsoon', 'Winter'], ARRAY[3, 4, 5, 6, 7, 8, 9, 10], '2-3 days', 'Budget', 70, false, ARRAY['Tibetan thukpa', 'Momos', 'Kangra chai'], ARRAY['Tibetan Losar', 'His Holiness birthday'], ARRAY['Namgyal monastery prayers', 'Triund trail overnight', 'Bhagsu waterfall', 'Tibetan Institute of Performing Arts']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'himachal_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4, 5], 'Clear Dhauladhar views and 15C-25C days.', ARRAY['Monastery visits', 'Triund trek', 'Cafes'], 'Medium', 'Budget', 'Excellent', 'Best season overall.', 1
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[6, 7, 8], 'Warm with evening downpours.', ARRAY['Kickstarting curves', 'Museum visits', 'Tibetan arts'], 'Medium', 'Budget', 'Good', 'Monsoon eases heat.', 2
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Golden light, fewer clouds.', ARRAY['Trekking', 'Photography'], 'Low', 'Budget', 'Excellent', 'Superb lens days.', 3
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Chill', ARRAY[12, 1], 'Frosty mornings, sunny days.', ARRAY['Monastery craft', 'Tea tastings'], 'Low', 'Budget', 'Good', 'Occasional snow in Mcleodganj.', 4
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Namgyal Monastery Prayers', 'Attend debate and prayer sessions of the Dalai Lama''s main temple.', 'dove', 'Spiritual', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], true, ARRAY['any'], 1
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Triund Trek', 'A 9 km climb from Dharamkot to a ridge camp with glacier views.', 'tent', 'Adventure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tsuglagkhang Complex', 'Main temple, museum and Kalachakra circles in one courtyard.', 'landmark', 'Cultural', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tea & Craft Trails', 'Kangra tea estates and Tibetan handicraft ateliers.', 'coffee', 'Culinary', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Dharamshala+Tibet', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Dharamshala+Tibet', 'Tsuglagkhang temple, Dharamshala', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'dharamshala'
ON CONFLICT DO NOTHING;

-- ---- Spiti Valley (himachal_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Spiti Valley', 'spiti', 'destination', 'A cold-desert Himalayan valley of ancient monasteries, ranked among India''s great offbeat drives.', 'The middle Himalayas'' cold desert, reached from Kaza along the high Kinnaur-Spiti road (opens May/June). Key, Kibber and Tabo monasteries stud the Spiti river canyon. Permits and hardy winter gear required.', 32.5514, 77.9731, 3650, ARRAY['Offbeat', 'High Altitude', 'Monasteries', 'Photography'], ARRAY['Summer', 'Autumn'], ARRAY[6, 7, 8, 9, 10], '2-3 days', 'Moderate', 62, true, ARRAY['Sea buckthorn', 'Buckwheat pancakes', 'Butter tea'], ARRAY['Losar', 'Kye Gompa festival'], ARRAY['Key monastery', 'Chandratal lake', 'Kibber village', 'Crossing the Kunzum La']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'himachal_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Open Summer', ARRAY[6, 7, 8], 'Blue skies, warm days, cold nights.', ARRAY['Monastery circuit', 'Chandratal camp', 'Village walks'], 'Medium', 'Moderate', 'Excellent', 'Roads and homestays open from June.', 1
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Golden Autumn', ARRAY[9, 10], 'Arid gold light and crystal night skies.', ARRAY['Photography', 'Trekking', 'Star camps'], 'Low', 'Moderate', 'Excellent', 'Cut-off from late October.', 2
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Isolation', ARRAY[11, 12, 1, 2], 'Deep snow and minus-25C.', ARRAY['Pangmo', 'Spiti winters tours'], 'Very Low', 'Budget', 'Fair', 'Specialist only.', 3
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Key Monastery Circuit', 'Cliff-perched medieval monastery with murals and 300 monks.', 'church', 'Spiritual', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Chandratal Lake Camp', 'Moon lake at 4,300 m on the Kunzum side, a starlit desert pool.', 'tent', 'Adventure', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kibber & Giu Walks', 'One of the world''s highest inhabited villages and ancient fossil sites nearby.', 'walk', 'Offbeat', ARRAY['any'], ARRAY[6, 7, 8, 9], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Star Photography', 'Some of India''s darkest skies for astro shots.', 'camera', 'Photography', ARRAY['any'], ARRAY[6, 7, 8, 9, 10], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Key+Monastery', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Key+Monastery', 'Key monastery above Spiti', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'spiti'
ON CONFLICT DO NOTHING;

-- ---- Jaipur (rajasthan) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Jaipur', 'jaipur', 'destination', 'The Pink City of forts, bazaars and royal courtyards — gateway to Rajasthan.', 'Rajasthan''s capital behind cobride walls, served by Jaipur international airport and rail to Delhi (300 km). Amber Fort, Hawa Mahal and the City Palace form a heritage triangle of the first rank.', 26.9124, 75.7873, 431, ARRAY['Heritage', 'Architecture', 'Shopping', 'Culinary'], ARRAY['Pleasant Winter', 'Spring', 'Summer'], ARRAY[10, 11, 12, 1, 2, 3], '2-3 days', 'Moderate', 90, false, ARRAY['Dal baati churma', 'Laal maas', 'Ghevar'], ARRAY['Teej', 'Jaipur Literature Festival', 'Kite Festival'], ARRAY['Amber Fort elephant/hybrid access', 'Bazaar crawl for block prints', 'Stepwell Nahargarh sunset', 'Cultural shows at Chokhi Dhani']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'rajasthan'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[10, 11, 12, 1, 2], 'Clear 8C-25C days ideal for sightseeing.', ARRAY['Fort circuit', 'Old city bazaars', 'Festivals'], 'High', 'Moderate', 'Excellent', 'Book heritage hotels early.', 1
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 3, 4], 'Warm days with blossoms.', ARRAY['Photography', 'Rajasthan safari'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Scorching Summer', ARRAY[5, 6], 'Unforgiving 35C-45C heat.', ARRAY['Museum afternoons', 'Pool retreats'], 'Low', 'Budget', 'Fair', 'Plan around early mornings.', 3
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Amber Fort', 'Hilltop rajput palace reached by shared jeeps or elephants.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Hawa Mahal & Bazaars', 'The winds'' palace facade and Johari Bazar''s gem and textile lanes.', 'building', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Nahargarh Sunset', 'Sunset terrace over the Pink City walls.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 3
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jal Mahal & Stepwells', 'Lake palace and old-city water architecture.', 'water', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Hawa+Mahal', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Hawa+Mahal', 'Hawa Mahal facade, Jaipur', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Amber+Fort', 'https://placehold.co/900x600/334155/e2e8f0?text=Amber+Fort', 'Amber Fort amphitheatre', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'jaipur'
ON CONFLICT DO NOTHING;

-- ---- Udaipur (rajasthan) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Udaipur', 'udaipur', 'destination', 'The ''city of lakes'' framed by the Aravali hills — Rajput romance on water.', 'Built around Lake Pichola under the Aravali ridge, 250 km from Jaipur with a small airport and rail connection. City Palace, lake palaces and ghat life make it the most photographed city in Rajasthan.', 24.5854, 73.7125, 600, ARRAY['Heritage', 'Lake', 'Romantic', 'Culinary'], ARRAY['Winter', 'Spring'], ARRAY[10, 11, 12, 1, 2, 3], '2-3 days', 'Moderate', 88, false, ARRAY['Laal maas', 'Dal baati', 'Kachori'], ARRAY['Mewar Festival', 'Shilpgram fair'], ARRAY['Sunset boat ride on Pichola', 'City Palace self-guided audio tour', 'Monsoon Palace viewpoint', 'Gangaur ghat ceremony']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'rajasthan'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Ideal', ARRAY[10, 11, 12, 1, 2], 'Mild 8C-25C and mirror-flat lakes.', ARRAY['Boat rides', 'Palace tours', 'Old city'], 'High', 'Moderate', 'Excellent', 'Prime season.', 1
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm and blooming round the lakes.', ARRAY['Garden walks', 'Marigold alleys'], 'Medium', 'Moderate', 'Good', 'Festive buzz.', 2
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8, 9], 'Rain refills Fateh Sagar and Pichola.', ARRAY['Lake views', 'Ghat restaurants'], 'Low', 'Budget', 'Good', 'Dramatic skies.', 3
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Lake Pichola Boat Ride', 'Golden-hour ride past Jag Mandir to the island palace.', 'boat', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'City Palace Complex', 'A layered mahal of courtyards, peacock mosaics and lake views.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kumbhalgarh Excursion', 'The Great Wall of India — a 36 km fort perimeter 82 km away.', 'landmark', 'Adventure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bagore Ki Haveli', 'Dance show and museum on the lake''s edge.', 'music', 'Cultural', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Udaipur+Pichola', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Udaipur+Pichola', 'Lake Pichola sunset', 'Placeholder', 'CC0', NULL, NULL, 'lake', 1
FROM public.destinations d WHERE d.slug = 'udaipur'
ON CONFLICT DO NOTHING;

-- ---- Jaisalmer (rajasthan) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Jaisalmer', 'jaisalmer', 'destination', 'The golden fort city rising from the Thar desert.', 'A walled sandstone town 575 km west of Jaipur, within a night train from Delhi and reachable by the Jodhpur-Jaisalmer line. Fort, havelis and Sam Dunes camel safaris define the desert experience.', 26.9157, 70.9083, 225, ARRAY['Desert', 'Heritage', 'Camel Safari', 'Forts'], ARRAY['Winter', 'Spring Stand-in', 'Monsoon'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Moderate', 76, false, ARRAY['Ker sangri', 'Gatte', 'Desert kulfi'], ARRAY['Desert Festival', 'Marwar festival'], ARRAY['Camel safari to Sam dunes', 'Fort laser/history walk', 'Gadisar lake sunset', 'Night stay under stars']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'rajasthan'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[10, 11, 12, 1, 2], 'Clear sunny 6C-25C desert days.', ARRAY['Dune safaris', 'Fort tours', 'Festivals'], 'High', 'Moderate', 'Excellent', 'The only season for easy camping.', 1
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring Heat', ARRAY[3, 4], 'Building heat, still dry.', ARRAY['Dawn safaris', 'Havelis'], 'Low', 'Budget', 'Good', 'Pre-dawn starts.', 2
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Tone', ARRAY[7, 8, 9], 'Thar''s rare rain greens the dunes.', ARRAY['Landscape photography'], 'Very Low', 'Budget', 'Fair', 'Roads to dunes may flood.', 3
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sam Sand Dunes Safari', 'Sunset camel trek and star-camp on the western dunes.', 'camel', 'Adventure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Living Fort of Jaisalmer', 'A 12th-century fort still inhabited and honeycombed with temples.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Patwon Ki Haveli', 'A five-brother merchant mansion carved in gold sandstone.', 'building', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gadisar Lake Sunset', 'Tank-side monasteries and temples at dusk.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Jaisalmer+Fort', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Jaisalmer+Fort', 'Jaisalmer fort from the dunes', 'Placeholder', 'CC0', NULL, NULL, 'desert', 1
FROM public.destinations d WHERE d.slug = 'jaisalmer'
ON CONFLICT DO NOTHING;

-- ---- Jodhpur (rajasthan) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Jodhpur', 'jodhpur', 'destination', 'The blue city beneath the Mehrangarh citadel.', 'Rajasthan''s second city, 300 km from Jaipur on the main Delhi rail corridor. The ridgetop Mehrangarh Fort and a labyrinthine blue old city are the anchors.', 26.2389, 73.0243, 231, ARRAY['Heritage', 'Forts', 'Blue City', 'Museums'], ARRAY['Winter', 'Spring'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Budget', 70, false, ARRAY['Makhaniya lassi', 'Mirchi vada', 'Gudiyon ki sabzi'], ARRAY['Marwar Festival', 'Jodhpur Flamenco'], ARRAY['Mehrangarh sound-and-light show', 'Sardar market spice crawl', 'Toorji stepwell', 'Rao Jodha rock park']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'rajasthan'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[10, 11, 12, 1, 2], 'Clear and cool.', ARRAY['Fort tours', 'Blue city walks', 'Museums'], 'Medium', 'Budget', 'Excellent', 'Great shoulder pricing.', 1
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm sunny days.', ARRAY['Stepwell photography', 'Old city'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[5, 6], 'Extreme heat.', ARRAY['Inside-fort museums', 'Basement restaurants'], 'Very Low', 'Budget', 'Fair', 'Escape the sun by noon.', 3
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mehrangarh Fort', 'Among India''s great citadels with palace galleries and a chauki durbar.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Blue City Walk', 'Brahmin quarter lanes painted in indigo wash above the clock tower.', 'walk', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Toorji''s Stepwell', 'Ornate 18th-century water architecture now ringed by cafes.', 'water', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Rao Jodha Desert Park', 'Restored arid landscape under the fort with native flora trails.', 'tree-pine', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 4
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mehrangarh+Fort', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mehrangarh+Fort', 'Mehrangarh above the blue city', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'jodhpur'
ON CONFLICT DO NOTHING;

-- ---- Pushkar (rajasthan) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Pushkar', 'pushkar', 'destination', 'A holy lake town of ghats, camels and the world''s largest camel fair.', 'A compact sacred town 145 km from Jaipur around the Pushkar lake. Its annual November camel fair and the only Brahma temple in India pull pilgrims and travellers alike.', 26.4897, 74.5514, 510, ARRAY['Spiritual', 'Cultural', 'Offbeat'], ARRAY['Winter', 'Spring'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Budget', 66, false, ARRAY['Malpua', 'Kachori', 'Chai bazaars'], ARRAY['Pushkar Camel Fair', 'Kartik Purnima'], ARRAY['Evening aarti at ghat steps', 'Camel fair rides & stalls', 'Savitri temple sunrise', 'Davis road cafes']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'rajasthan'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Fair Winter', ARRAY[10, 11, 12], 'Cool fair season with the camel fest in Kartik.', ARRAY['Camel fair', 'Ghat aarti', 'Bazaars'], 'Very High', 'Moderate', 'Good', 'Book months ahead for the fair.', 1
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Pleasant settled days.', ARRAY['Spiritual circuits', 'Cafes', 'Photography'], 'Medium', 'Budget', 'Excellent', '', 2
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm and calm.', ARRAY['Lake morning walks', 'Temple hops'], 'Low', 'Budget', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Pushkar Camel Fair', 'November''s giant camera-friendly livestock and bazaar fair.', 'camel', 'Cultural', ARRAY['any'], ARRAY[11], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Brahma Temple & Ghats', 'Rare shrine to Brahma with the 52 temple ghats below.', 'church', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Savitri Temple Sunrise', 'Hilltop climb for a golden view over the lake.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ghat Aarti Evening', 'Sunset lamps set afloat on the sarovar.', 'dove', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pushkar+Lake', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pushkar+Lake', 'Pushkar ghats at dusk', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'pushkar'
ON CONFLICT DO NOTHING;

-- ---- Agra (uttar_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Agra', 'agra', 'destination', 'Home of the Taj Mahal — the moon-white mausoleum of love.', 'Agra Fort, Fatehpur Sikri and the Taj sit on the Yamuna, 200 km from Delhi by train or the new Yamuna Expressway. Sunrise entry to the Taj is the signature ritual.', 27.1767, 78.0081, 171, ARRAY['Heritage', 'Architecture', 'World Wonder'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[10, 11, 12, 1, 2, 3], '2-3 days', 'Moderate', 92, false, ARRAY['Petha', 'Bedai with jalebi', 'Mughlai'], ARRAY['Taj Mahotsav', 'Ram Barat'], ARRAY['Taj at sunrise', 'Agra fort ramparts', 'Fatehpur Sikri day trip', 'Old books & marble inlay work']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttar_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[10, 11, 12, 1, 2], 'Cool 8C-24C, clear haze-free mornings.', ARRAY['Taj sunrise', 'Fort', 'Sikri'], 'High', 'Moderate', 'Excellent', 'Best time.', 1
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm but fine early starts.', ARRAY['Taj sunrise', 'Garden walks'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Heat', ARRAY[5, 6], '45C+ days; hits the marble glare.', ARRAY['Indoor museums', 'Taj at dawn only'], 'Low', 'Moderate', 'Fair', 'Strictly dawn visits.', 3
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Humid, occasional heavy cells.', ARRAY['Fort interiors', 'Craft bazaars'], 'Low', 'Moderate', 'Fair', 'Carry rain gear.', 4
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Taj Mahal Sunrise', 'Entry at dawn for pink-marble light before the crowds.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Agra Fort', '1500-ft red-sandstone fortress with palace views to the Taj.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Fatehpur Sikri Day Trip', 'Akbar''s abandoned imperial ghost city, 40 km west.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Marble Inlay Workshop', 'Watch pieta dura artisans practicing Taj-era craft.', 'hand', 'Cultural', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Taj+Mahal', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Taj+Mahal', 'Taj Mahal reflected at dawn', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Agra+Fort', 'https://placehold.co/900x600/334155/e2e8f0?text=Agra+Fort', 'Agra Fort along the Yamuna', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'agra'
ON CONFLICT DO NOTHING;

-- ---- Varanasi (uttar_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Varanasi', 'varanasi', 'destination', 'The eternal city on the Ganga — ghats, aartis and winding lanes.', 'One of the world''s oldest living cities, on the Ganges with direct rail from Delhi and an airport 22 km out. Dawn boat rides and the Dev Deepawali aarti are the core experiences.', 25.3176, 82.9739, 81, ARRAY['Spiritual', 'Heritage', 'Cultural'], ARRAY['Winter', 'Spring', 'Post-monsoon'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Budget', 88, false, ARRAY['Kachori sabzi', 'Banarasi paan', 'Malaiyyo'], ARRAY['Dev Deepawali', 'Shivratri', 'Ganga Mahotsav'], ARRAY['Dawn Ganga boat ride', 'Evening Ganga aarti at Dasashwamedh', 'Kashi Vishwanath corridor', 'Sarnath Buddhist ruins']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttar_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Festive Winter', ARRAY[10, 11, 12, 1, 2], 'Clear and brisk.', ARRAY['Boat rides', 'Aarti', 'Alley walks'], 'High', 'Budget', 'Excellent', 'Dev Deepawali (Nov) spectacular.', 1
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm days, crowded ghats.', ARRAY['Temple circuit', 'Photography'], 'Medium', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Humid with river swells.', ARRAY['Ghat promenades', 'Banaras silk'], 'Low', 'Budget', 'Fair', 'Boats restricted at flood time.', 3
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dawn Boat on the Ganga', 'Subah-e-Banaras glide past the ghats as the city wakes.', 'boat', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dasashwamedh Aarti', 'Large evening fire-and-lamp ceremony on the main ghat.', 'dove', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kashi Vishwanath Corridor', 'The newly opened Golden Temple approach.', 'church', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sarnath Half-Day', 'Buddha''s first-sermon site with the Ashoka pillar, 10 km away.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Varanasi+Ghats', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Varanasi+Ghats', 'Varanasi ghats at dawn', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'varanasi'
ON CONFLICT DO NOTHING;

-- ---- Mathura-Vrindavan (uttar_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Mathura-Vrindavan', 'mathura_vrindavan', 'destination', 'Birthplace of Krishna — temple-dense sacred towns on the Yamuna.', 'Twin holy towns 150 km from Delhi on the Agra road (with dedicated rail). Temples, Govardhan hill and a raw devotional tempo define the experience, peaking at Holi and Janmashtami.', 27.4924, 77.6737, 175, ARRAY['Spiritual', 'Cultural', 'Festivals'], ARRAY['Winter', 'Spring'], ARRAY[10, 11, 12, 1, 2, 3], '2-3 days', 'Budget', 60, false, ARRAY['Peda', 'Makhan mishri', 'Rajasthani-chaat', 'Malpua'], ARRAY['Lathmar Holi', 'Janmashtami', 'Krishna Janmotsav'], ARRAY['Prem Mandir evening show', 'Keshav Dev temple', 'Govardhan parikrama', 'Holi in Barsana']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttar_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[10, 11, 12, 1, 2], 'Pleasant, busy with pilgrims.', ARRAY['Temple circuit', 'Evening aartis'], 'High', 'Budget', 'Excellent', 'Avoid weekends for the crowds.', 1
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring Holi', ARRAY[3], 'Kite-and-colour madness.', ARRAY['Barsana Lathmar Holi', 'Colour streets'], 'Very High', 'Budget', 'Good', 'March 2026 Holi — plan early.', 2
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Hot and steamy.', ARRAY['Temple interiors', 'Shravan vrat'], 'Medium', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Prem Mandir Spectacle', 'Illuminated marble temple with evening light-and-kirtan show.', 'church', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['any'], 1
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Boond & Yamuna Ghats', 'Sacred baths and tiny shrines down to the river.', 'water', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Barsana Lathmar Holi', 'The world-famous stick-festival village, a March ritual.', 'mask', 'Cultural', ARRAY['any'], ARRAY[3], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gokul & Govardhan', 'Krishna''s childhood pastures and parikrama hill.', 'mountain', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Vrindavan+Temples', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Vrindavan+Temples', 'Vrindavan temple skyline', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'mathura_vrindavan'
ON CONFLICT DO NOTHING;

-- ---- Rishikesh (uttarakhand) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Rishikesh', 'rishikesh', 'destination', 'Yoga capital of the world on the Ganges — ashrams, rafting and beach cafes.', 'An ashram-lined town where the Ganges leaves the mountains, 25 km from Dehradun airport and 240 km from Delhi. Yoga teacher trainings, Laxman Jhula and Grade-3 white-water rafting anchor the scene.', 30.0869, 78.2676, 372, ARRAY['Adventure', 'Yoga', 'River Rafting', 'Spiritual'], ARRAY['Spring Rafting', 'Summer', 'Winter Yoga'], ARRAY[2, 3, 4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Budget', 78, false, ARRAY['Ganga-side thalis', 'Sattvic meals', 'Chole kulche'], ARRAY['International Yoga Festival', 'Kanwar Yatra'], ARRAY['Sunrise rafting on the Ganga', 'Vashishtha cave walk', 'Neer Garh waterfall trek', 'Aarti at Triveni ghat']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttarakhand'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Prime Rafting', ARRAY[9, 10, 11, 12, 1, 2], 'Cool, clear, raftable water.', ARRAY['Rafting', 'Yoga', 'Beach camps'], 'High', 'Budget', 'Excellent', 'Winter sun is on the river.', 1
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Hot with full snow melt.', ARRAY['Morning rafting', 'Waterfall treks'], 'Medium', 'Budget', 'Good', 'Beat the heat by dawn.', 2
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Caution', ARRAY[7, 8], 'Rafting closed, rain heavy.', ARRAY['Ashrams', 'Cafes', 'Temples'], 'Low', 'Budget', 'Fair', 'Landslides possible.', 3
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ganga River Rafting', 'Marine Drive stretch rapids from Shivpuri, grades 2-3 with guides.', 'waves', 'Adventure', ARRAY['any'], ARRAY[9, 10, 11, 12, 1, 2, 3, 4, 5, 6], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Yoga Classes', 'Morning ashtanga and pranayama at ghat-side studios.', 'sparkles', 'Wellness', ARRAY['any'], ARRAY[9, 10, 11, 12, 1, 2, 3, 4], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Vashishtha Cave & Neer Garh', 'Trek to the ashram cave then the waterfall above the river.', 'mountain', 'Adventure', ARRAY['any'], ARRAY[9, 10, 11, 12, 1, 2, 3, 4], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Triveni Ghat Aarti', 'Sunset lamp ceremony under the Lakshman Jhula at dusk.', 'dove', 'Spiritual', ARRAY['any'], ARRAY[1, 2, 3, 4, 5, 6, 9, 10, 11, 12], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rishikesh+Laxman+Jhula', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rishikesh+Laxman+Jhula', 'Laxman Jhula over the Ganga', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'rishikesh'
ON CONFLICT DO NOTHING;

-- ---- Mussoorie (uttarakhand) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Mussoorie', 'mussoorie', 'destination', 'Queen of the hills — a mist-loved colonial ridge town.', 'A deodar-and-coffee hill station 35 km from Dehradun airport, with the Mall Road ridge walking spine and the Himalayan range behind Kempty falls. Weekend favourite of Delhi.', 30.4598, 78.0644, 2000, ARRAY['Hill Station', 'Heritage', 'Weekend Escape'], ARRAY['Summer', 'Monsoon', 'Winter Snow'], ARRAY[4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 68, false, ARRAY['Momos', 'Waffles', 'Rajma chawal'], ARRAY['Winterline Fair', 'Mall festival'], ARRAY['Camel''s Back walk', 'Kempty falls', 'Gun Hill cable car', 'Company garden sunset']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttarakhand'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Cool 12C-22C, escape heat.', ARRAY['Mall Road', 'Kempty', 'Cable car'], 'High', 'Moderate', 'Good', 'Weekends packed.', 1
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Rains and mists lock the ridge.', ARRAY['Cafes', 'Library walks'], 'Low', 'Moderate', 'Fair', 'Views vanish.', 2
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Crisp and clear again.', ARRAY['Sunset views', 'Hiking'], 'Medium', 'Moderate', 'Excellent', 'Best season.', 3
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1], 'Frost and occasional snow.', ARRAY['Winterline fair', 'Fog walks'], 'Medium', 'Moderate', 'Good', '', 4
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mall Road & Camel''s Back', 'Flat ridge promenade with the full Himalayan horizon.', 'walk', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11, 12], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gun Hill Cable Car', 'Short tram to the ridge''s highest point.', 'cable', 'Adventure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kempty Falls', 'Cascading terraces 15 km out, famous for picnics.', 'water', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10], false, ARRAY['clear', 'sunny'], 3
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Company Garden & Cloud End', 'Terraced gardens and an orchard sunset point.', 'tree-pine', 'Leisure', ARRAY['any'], ARRAY[9, 10, 11, 12], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mussoorie+Ridge', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mussoorie+Ridge', 'Mussoorie Mall Road in mist', 'Placeholder', 'CC0', NULL, NULL, 'hill_station', 1
FROM public.destinations d WHERE d.slug = 'mussoorie'
ON CONFLICT DO NOTHING;

-- ---- Nainital (uttarakhand) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Nainital', 'nainital', 'destination', 'The emerald lake town cradled by seven hills.', 'A pear-shaped Naini lake ring of a hill town, 300 km from Delhi and 64 km from Kathgodam railhead. Boating, the high-altitude Naini peak and the zoo-mall circuit define it.', 29.3919, 79.4542, 2084, ARRAY['Hill Station', 'Lake', 'Heritage'], ARRAY['Summer', 'Autumn', 'Winter'], ARRAY[4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 65, false, ARRAY['Bun momos', 'Kulcha', 'Bal mithai'], ARRAY['Nanda Devi Fair', 'Winter Carnival'], ARRAY['Morning boat on Naini lake', 'Naina Devi temple', 'Tiffin Top horses', 'Snow point in winter']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttarakhand'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Mild lake weather.', ARRAY['Boating', 'Mall', 'Tiffin top'], 'High', 'Moderate', 'Good', '', 1
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Clear golden hills.', ARRAY['Photography', 'Lake walks'], 'Medium', 'Moderate', 'Excellent', 'Best.', 2
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Snow carpets the market bowl.', ARRAY['Snow point', 'Fog lakeside'], 'Medium', 'Moderate', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Naini Lake Boating', 'Rowing boats and early light on the tear-drop lake.', 'boat', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11, 12], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Naina Devi Temple', 'A Himalayan shrine at the lake''s northern corner.', 'church', 'Spiritual', ARRAY['any'], ARRAY[1, 2, 3, 4, 5, 6, 9, 10, 11, 12], false, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tiffin Top Ponies', 'Horse ride to a picnic knoll above the northern ridge.', 'horse', 'Adventure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10], false, ARRAY['clear', 'sunny'], 3
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Snow Point', 'Winter sledging slope at the far end of the lake.', 'snowflake', 'Adventure', ARRAY['any'], ARRAY[12, 1, 2], false, ARRAY['snow', 'clear'], 4
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Nainital+Lake', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Nainital+Lake', 'Naini lake ringed by hills', 'Placeholder', 'CC0', NULL, NULL, 'lake', 1
FROM public.destinations d WHERE d.slug = 'nainital'
ON CONFLICT DO NOTHING;

-- ---- Auli (uttarakhand) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Auli', 'auli', 'destination', 'A garhwali ski slope and ropeway above the Nanda Devi amphitheatre.', 'An open snow bowl at 2,519-3,050 m with a cable-car link from Joshimath and a road from Badrinath highway. India''s most popular beginner ski slopes with a famous 12-km deodar trek.', 30.5272, 79.5622, 2519, ARRAY['Adventure', 'Skiing', 'Alpine Meadows', 'Meadow Treks'], ARRAY['Winter Ski', 'Summer', 'Autumn'], ARRAY[12, 1, 2, 3, 5, 6, 9, 10], '2-3 days', 'Budget', 58, false, ARRAY['Kandalee ki sabzi', 'Garhwali rotis', 'Jhangora kheer'], ARRAY['Auli Winter Sport Festival', 'Nanda Devi Raj Jat'], ARRAY['Ski courses (Jan-Mar)', 'Ropeway to Auli', 'Trek to Gorson top', 'Chattar Kund lake']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'uttarakhand'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Ski Season', ARRAY[12, 1, 2, 3], 'Fresh powder and training courses.', ARRAY['Skiing', 'Snow grooming', 'Ropeway'], 'Medium', 'Budget', 'Great', 'Book ski certs in advance.', 1
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[5, 6, 7], 'Alpine meadows bloom.', ARRAY['Gorson trek', 'Photography', 'Camping'], 'Low', 'Budget', 'Great', 'Hidden-gem value.', 2
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10], 'Crystal Nanda Devi views.', ARRAY['Trekking', 'Ropeway rides'], 'Low', 'Budget', 'Excellent', '', 3
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Auli Ski Courses', 'Beginner-to-intermediate runs with certified instructors and rentals.', 'snowflake', 'Adventure', ARRAY['any'], ARRAY[12, 1, 2, 3], false, ARRAY['snow', 'clear'], 1
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Auli-Joshimath Ropeway', 'Asia''s longest public cable car with layered ridge views.', 'cable', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2, 3, 4, 5, 6], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gorson Meadow Trek', 'A 3 km trail to a lookout over the Nanda Devi range.', 'mountain', 'Adventure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear', 'sunny'], 3
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kwang Temple & Chattar Kund', 'Forest temple climb and a mirroring lake.', 'church', 'Spiritual', ARRAY['any'], ARRAY[4, 5, 6, 9], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Auli+Snow+Bowl', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Auli+Snow+Bowl', 'Auli ski bowl in winter', 'Placeholder', 'CC0', NULL, NULL, 'winter', 1
FROM public.destinations d WHERE d.slug = 'auli'
ON CONFLICT DO NOTHING;

-- ---- Darjeeling (west_bengal) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Darjeeling', 'darjeeling', 'destination', 'The queen of Himalayan hill stations — tea gardens and the toy train.', 'A tea-country ridge town 88 km from Bagdogra airport, famous for the Kanchenjunga sunrise at Tiger Hill and the UNESCO Darjeeling Himalayan Railway. Tea estates and Ghoom monastery complete the mix.', 27.036, 88.2627, 2045, ARRAY['Hill Station', 'Tea', 'Heritage', 'Himalayan Views'], ARRAY['Spring', 'Summer', 'Autumn', 'Winter'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 80, false, ARRAY['Momos', 'Thukpa', 'Darjeeling first-flush tea'], ARRAY['Darjeeling Carnival', 'Trekker''s festival'], ARRAY['Tiger Hill sunrise', 'Toy train joyride', 'Happy Valley tea tour', 'Darjeeling zoo & Himalayan Mountaineering Institute']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'west_bengal'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Clear Kanchenjunga views.', ARRAY['Tiger Hill', 'Tea tours', 'Toy train'], 'High', 'Moderate', 'Excellent', 'Best season.', 1
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[5, 6], 'Mild, rhododendrons.', ARRAY['Trekking', 'Garden walks'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Crisp visibility returns.', ARRAY['Photography', 'Tea plucking'], 'Medium', 'Moderate', 'Excellent', '', 3
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Biting cold, clear snowline.', ARRAY['Tiger Hill', 'Museum days'], 'Low', 'Moderate', 'Good', 'Pack thermal layers.', 4
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tiger Hill Sunrise', 'Pre-dawn vigil for Kanchenjunga''s alpenglow.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3, 4], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Darjeeling Himalayan Railway', 'A steam joy-ride on the UNESCO-listed toy train.', 'train', 'Heritage', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Happy Valley Tea Estate', 'A working 19th-century estate fractioned out to pluckers and pressers.', 'leaf', 'Culinary', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], false, ARRAY['clear', 'rainy'], 3
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Batasia Loop & Ghoom', 'Spiral rail loop and the high-altitude monastery viewpoint.', 'train', 'Heritage', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Darjeeling+Tea+Gardens', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Darjeeling+Tea+Gardens', 'Tea garden terraces, Darjeeling', 'Placeholder', 'CC0', NULL, NULL, 'tea', 1
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Toy+Train', 'https://placehold.co/900x600/334155/e2e8f0?text=Toy+Train', 'Darjeeling toy train', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'darjeeling'
ON CONFLICT DO NOTHING;

-- ---- Sundarbans (west_bengal) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Sundarbans', 'sundarbans', 'destination', 'The world''s largest tidal mangrove forest — the tiger''s estuary kingdom.', 'A UNESCO Biosphere Reserve of delta islands between Kolkata and Bangladesh, entered from Sonakhali/Godkhali (100 km from Kolkata). Boat safaris seek the Royal Bengal tiger, estuarine crocs and Gangetic dolphins.', 22.0309, 88.7384, 3, ARRAY['Wildlife', 'Boat Safari', 'Mangroves', 'Offbeat'], ARRAY['Winter', 'Post-monsoon', 'Summer'], ARRAY[11, 12, 1, 2], '2-3 days', 'Moderate', 58, false, ARRAY['Fish curry', 'Chital meat (permits)', 'Golden prawns'], ARRAY['Bonbibi Puja', 'Sunder Mela'], ARRAY['Canoe through creeks', 'Sudhanyakhali watchtower', 'Dayakumari island forest', 'Dolphin spotting at Sajnekhali']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'west_bengal'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Best Season', ARRAY[11, 12, 1, 2], 'Dry, cool, animal movements on bank.', ARRAY['Boat safaris', 'Watchtowers', 'Birding'], 'Medium', 'Moderate', 'Excellent', 'Permits via forest dept needed.', 1
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[3, 4, 5], 'Hot but visible tiger roaming.', ARRAY['Early safaris'], 'Medium', 'Moderate', 'Good', 'June heat extreme.', 2
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Closed', ARRAY[7, 8, 9], 'Creeks swell; many routes closed.', ARRAY['Rain-window boat rides'], 'Low', 'Moderate', 'Poor', 'Parks often close.', 3
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Canopy Boat Safari', 'Multi-hour motorized prowl through mangrove channels.', 'boat', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Watchtower Stops', 'Sudhanyakhali and Sajnekhali towers with tiger-print mudbanks.', 'eye', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sajnekhali Bird Center', 'Herons, kingfishers and muddy island waders.', 'bird', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dolphin Sighting', 'Gangetic dolphins in the estuary channels at dawn.', 'fish', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Sundarbans+Creek', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Sundarbans+Creek', 'Mangrove creek in the Sundarbans', 'Placeholder', 'CC0', NULL, NULL, 'wildlife', 1
FROM public.destinations d WHERE d.slug = 'sundarbans'
ON CONFLICT DO NOTHING;

-- ---- Gangtok (sikkim) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Gangtok', 'gangtok', 'destination', 'Sikkim''s hill capital of monasteries, cable cars and Kanchenjunga framing.', 'A neat hill city 124 km from Bagdogra airport and a short drive from the Tsomgo lake road. Rumtek monastery, the ropeway and weekend views of Kanchenjunga make it Sikkim''s basecamp.', 27.3389, 88.6065, 1650, ARRAY['Hill Station', 'Monasteries', 'Himalayan Views', 'Culture'], ARRAY['Summer', 'Autumn', 'Winter'], ARRAY[3, 4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 74, false, ARRAY['Thukpa', 'Gundruk', 'Sikkimese momos'], ARRAY['Losar', 'Saga Dawa', 'International Flower Festival'], ARRAY['MG Marg stroll', 'Gangtok ropeway', 'Rumtek monastery', 'Tsomgo & Nathu La permits']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'sikkim'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Cherry/pollen-clear views.', ARRAY['MG Marg', 'Rumtek', 'Flower fest'], 'High', 'Moderate', 'Excellent', '', 1
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[5, 6], 'Warm days, valleys in bloom.', ARRAY['Ropeway', 'Pine trails'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Best Kanchenjunga visibility.', ARRAY['Photography', 'Tsomgo day', 'Homestays'], 'High', 'Moderate', 'Excellent', 'Peak trekking season.', 3
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Cold and clear with snow roads above.', ARRAY['Tsomgo snow', 'Monastery lights'], 'Low', 'Moderate', 'Good', '', 4
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Rumtek Monastery', 'The largest monastery in Sikkim, seat of the Karmapa.', 'church', 'Spiritual', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'MG Marg & Ropeway', 'Pedestrian heart of Gangtok and a cable swoop over the valleys.', 'cable', 'Leisure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], false, ARRAY['clear', 'any'], 2
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tsomgo Lake Day Trip', 'Sacred glacial lake at 3,780 m on the Nathu La road (permits).', 'water', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Do Drul Chorten & Institute', 'Tibetan stupa complex and the Namgyal Institute of Tibetology.', 'landmark', 'Cultural', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gangtok+Kanchenjunga', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gangtok+Kanchenjunga', 'Kanchenjunga above Gangtok', 'Placeholder', 'CC0', NULL, NULL, 'mountain', 1
FROM public.destinations d WHERE d.slug = 'gangtok'
ON CONFLICT DO NOTHING;

-- ---- Kaziranga (assam) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Kaziranga', 'kaziranga', 'destination', 'One-horned rhino country — a UNESCO grassland river park.', 'A 430 sq km national park on the Brahmaputra floodplains, 192 km from Guwahati airport on the NH27. Elephant-back and jeep safaris in its tall elephant-grass meadows are the draws.', 26.5787, 93.1649, 81, ARRAY['Wildlife', 'Safari', 'Grasslands'], ARRAY['Winter Safari', 'Summer', 'Monsoon Closed'], ARRAY[11, 12, 1, 2], '2-3 days', 'Moderate', 76, false, ARRAY['Assam thali', 'Jolpan', 'Duck curry'], ARRAY['Kaziranga Festival', 'Bihu'], ARRAY['Morning jeep safari', 'Elephant-back safari', 'Kohora range watch', 'Kakochang waterfalls']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'assam'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Open Safari Season', ARRAY[11, 12, 1, 2], 'Dry grass opens; rhino most visible.', ARRAY['Jeep safaris', 'Elephant rides', 'Birding'], 'High', 'Moderate', 'Excellent', 'Book central safaris early.', 1
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer Pre-Monsoon', ARRAY[3, 4, 5], 'Hot but animals at water points.', ARRAY['Early safaris'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Closure', ARRAY[7, 8, 9], 'Brahmaputra floods the park.', ARRAY['Village visits', 'Birding outside'], 'Very Low', 'Budget', 'Poor', 'Park shut July-Sept.', 3
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jeep Safari', 'Rhino, wild buffalo, hog deer and hornbills from open-top vehicles.', 'car', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Elephant-back Safari', 'Dawn rides closest to grazing rhino.', 'animal', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kakochang Waterfall & Ruins', 'Falls and ruined temples just outside the park.', 'water', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Birding Along the Brahmaputra', 'Darters, herons and the Bengal florican in marginal wetlands.', 'bird', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Kaziranga+Rhino', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Kaziranga+Rhino', 'One-horned rhino in tall grass', 'Placeholder', 'CC0', NULL, NULL, 'wildlife', 1
FROM public.destinations d WHERE d.slug = 'kaziranga'
ON CONFLICT DO NOTHING;

-- ---- Majuli (assam) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Majuli', 'majuli', 'destination', 'The world''s largest river island, shaped by the Brahmaputra''s braids.', 'An erosion-threatened island world of neo-Vaishnavite sattras (monasteries), mask makers and weaving, reached by ferry from Jorhat (nearest airport/rail). A serene, genuinely offbeat stopover.', 26.95, 94.1667, 85, ARRAY['Offbeat', 'Cultural', 'Island Life', 'Handicrafts'], ARRAY['Winter', 'Post-monsoon'], ARRAY[11, 12, 1, 2], '2-3 days', 'Budget', 50, true, ARRAY['Pork fry', 'Bamboo shoot pickle', 'Rice beer'], ARRAY['Raas Leela', 'Majuli heritage week'], ARRAY['Mask making at Samaguri sattra', 'Sattriya dance evenings', 'Cycle the island lanes', 'Sunset over the Brahmaputra']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'assam'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Prime', ARRAY[11, 12, 1, 2], 'Dry and mild.', ARRAY['Sattra visits', 'Cycling', 'Ferries'], 'Low', 'Budget', 'Excellent', 'Ferries run till the afternoon.', 1
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm fields, weavers at work.', ARRAY['Craft trails'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Erosion and high water.', ARRAY['Village life'], 'Very Low', 'Budget', 'Fair', 'Ferries disrupted.', 3
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Samaguri Sattra Mask Studio', 'Watch paper-bamboo mask artisans rehearse Raas drama.', 'mask', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], true, ARRAY['any'], 1
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Cycle the Island', '15 km of paddy lanes linking sattras and weaving cooperatives.', 'bike', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Brahmaputra Sunset Ferry', 'The return crossing in orange evening light.', 'boat', 'Photography', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mishing Village Homestay', 'Overnight meals and weaving in stilt-house villages.', 'home', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Majuli+River', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Majuli+River', 'Brahmaputra braids around Majuli', 'Placeholder', 'CC0', NULL, NULL, 'landscape', 1
FROM public.destinations d WHERE d.slug = 'majuli'
ON CONFLICT DO NOTHING;

-- ---- Shillong (meghalaya) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Shillong', 'shillong', 'destination', 'The Scotland of the East — pine hills above the Assam plains.', 'Meghalaya''s capital, 103 km from Guwahati airport but a rain-softened green landscape of its own. Ward''s Lake, the Crinoline falls viewpoints and nearby Mawphlang sacred groves make it a gentle base.', 25.5788, 91.8933, 1525, ARRAY['Hill Station', 'Pine Hills', 'Cultural', 'Weekend'], ARRAY['Summer', 'Autumn', 'Monsoon'], ARRAY[4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Budget', 62, false, ARRAY['Jadoh', 'Tungrymbai', 'Momos'], ARRAY['Shad Suk Mynsiem', 'Behdienkhlam'], ARRAY['Ward''s Lake paddle', 'Elephant falls', 'Police Bazaar shopping', 'Mawphlang sacred grove']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'meghalaya'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Pleasant 18C-25C, green.', ARRAY['Lake walks', 'Falls', 'City cafes'], 'High', 'Budget', 'Good', '', 1
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Clear golden hills.', ARRAY['Sacred groves', 'Photography'], 'Medium', 'Budget', 'Excellent', 'Best.', 2
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Torrential but lush.', ARRAY['Cafes', 'Falls in spate'], 'Low', 'Budget', 'Good', 'Live root bridges nearby.', 3
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Cool crisp mornings.', ARRAY['Tea gardens', 'Village walks'], 'Medium', 'Budget', 'Good', '', 4
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ward''s Lake Circuit', 'A wooden walkway and rowboats around a tree-lined lake.', 'boat', 'Leisure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Elephant Falls', 'Three-tier cascade in the pine forest below town.', 'water', 'Leisure', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mawphlang Sacred Grove', 'A 1,000-year protected forest with monoliths, 25 km out.', 'tree-pine', 'Cultural', ARRAY['any'], ARRAY[9, 10, 11, 12, 3, 4], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Khyndailad & Police Bazaar', 'Night market for garlic chutney, khasi crafts and street food.', 'shopping', 'Cultural', ARRAY['any'], ARRAY[3, 4, 5, 6, 9, 10, 11], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Shillong+Pines', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Shillong+Pines', 'Pine hills around Shillong', 'Placeholder', 'CC0', NULL, NULL, 'hill_station', 1
FROM public.destinations d WHERE d.slug = 'shillong'
ON CONFLICT DO NOTHING;

-- ---- Cherrapunji (meghalaya) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Cherrapunji', 'cherrapunji', 'destination', 'Sohra — the world''s wet capital of living root bridges and cascades.', '1,489 m above the plains and once the wettest place on Earth. The double-decker living root bridge at Nongriat and the valley-edge outlooks reward a short, steep descent from Sohra town.', 25.2971, 91.5811, 1485, ARRAY['Offbeat', 'Waterfall', 'Living Root Bridges', 'Trekking'], ARRAY['Spring', 'Post-Monsoon', 'Monsoon'], ARRAY[1, 2, 3, 4, 9, 10, 11, 12], '2-3 days', 'Budget', 60, false, ARRAY['Pukhlein', 'Doikhleh', 'Lake dumplings'], ARRAY['Nongkrem Dance'], ARRAY['Nongriat double-decker bridge', 'Nohkalikai falls viewpoint', 'Mawsmai caves', 'Seven Sisters viewpoint']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'meghalaya'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Post-Monsoon', ARRAY[9, 10, 11], 'Falls at full ferocity, mud settles.', ARRAY['Root bridges', 'Viewpoints'], 'Medium', 'Budget', 'Excellent', 'Pooled water can be cold.', 1
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Dry Season', ARRAY[1, 2, 3, 4], 'Clear down-valley views, easier trails.', ARRAY['Bridge treks', 'Caves'], 'Medium', 'Budget', 'Great', 'Drier but falls are lighter.', 2
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Core', ARRAY[6, 7, 8], 'Extreme rain, trail mud.', ARRAY['Waterfall viewing'], 'Low', 'Budget', 'Fair', 'Root bridge descent dangerous in rain.', 3
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Double-Decker Root Bridge', 'A 3,500-step descent to Nongriat''s two-level living bridge.', 'tree-pine', 'Adventure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Nohkalikai Falls View', 'India''s tallest plunge waterfall falling into a churning plunge pool.', 'water', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3, 4], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mawsmai Caves', 'A lit limestone cave of stagmites and bats.', 'tent', 'Adventure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], true, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Seven Sisters Point', 'A cliff panorama of Bangladesh plains and the plains below.', 'mountain', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Root+Bridge', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Root+Bridge', 'Living root bridge at Nongriat', 'Placeholder', 'CC0', NULL, NULL, 'nature', 1
FROM public.destinations d WHERE d.slug = 'cherrapunji'
ON CONFLICT DO NOTHING;

-- ---- Tawang (arunachal_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Tawang', 'tawang', 'destination', 'A high-altitude Buddhist enclave crowned by India''s largest monastery.', 'A 300-km winding road from Tezpur/Guwahati towards the Bhutan-China borderlands brings you to Tawang at 3,048 m. The 17th-century monastery, Sela Pass and the Madhuri lake define a genuinely far-flung journey.', 27.5869, 91.8623, 3048, ARRAY['Offbeat', 'Monasteries', 'High Altitude', 'Road Trips'], ARRAY['Summer', 'Autumn', 'Winter'], ARRAY[5, 6, 7, 8, 9, 10], '2-3 days', 'Moderate', 52, true, ARRAY['Momos', 'Thukpa', 'Butter tea'], ARRAY['Torgya Festival', 'Losar', 'Sela Pass tradition'], ARRAY['Tawang monastery courtyards', 'Sela pass lake', 'Madhuri & PT Tso lakes', 'Gorichen peak treks']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'arunachal_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[5, 6, 7, 8], 'Roads open, pleasant 10C-20C.', ARRAY['Monasteries', 'Lake drives', 'Trekking'], 'Low', 'Moderate', 'Good', 'Monsoon haze kicks in July.', 1
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10], 'Crystal visibility of Gorichen.', ARRAY['Photography', 'Village walks'], 'Low', 'Moderate', 'Excellent', 'Best window.', 2
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Sela Pass snow-bound, cut off.', ARRAY['Tawang town life'], 'Very Low', 'Moderate', 'Fair', 'Road closures common.', 3
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tawang Monastery', 'Founded 1680-81, the largest monastery in India with a golden Buddha hall.', 'church', 'Spiritual', ARRAY['any'], ARRAY[5, 6, 7, 8, 9, 10], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sela Pass & Lake', '4,170 m pass with a glassy high-altitude lake.', 'mountain', 'Adventure', ARRAY['any'], ARRAY[5, 6, 7, 8, 9, 10], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'PT Tso & Madhuri Lakes', 'Pristine sky-blue lakes off the monastery road.', 'water', 'Photography', ARRAY['any'], ARRAY[5, 6, 7, 8, 9], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gorichen Peak Base', 'A glimpse of the sacred Gorichen (6,858 m) from Tawang.', 'mountain', 'Photography', ARRAY['any'], ARRAY[9, 10], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Tawang+Monastery', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Tawang+Monastery', 'Tawang monastery above the valley', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'tawang'
ON CONFLICT DO NOTHING;

-- ---- Puri (odisha) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Puri', 'puri', 'destination', 'Seaside home of the Jagannath Temple and the sacred Blue Flag beach.', 'One of the four dhams, on the Odisha coast 60 km from Bhubaneswar airport and rail. The Rath Yatra, the state''s finest beach and the neighbouring Konark Sun Temple make a complete Odisha circuit.', 19.8135, 85.8312, 3, ARRAY['Spiritual', 'Beach', 'Heritage'], ARRAY['Winter', 'Summer', 'Monsoon'], ARRAY[11, 12, 1, 2, 10], '2-3 days', 'Budget', 68, false, ARRAY['Dalma', 'Chenna poda', 'Mahaprasad'], ARRAY['Rath Yatra', 'Chandan Yatra', 'Konark Dance Festival'], ARRAY['Jagannath darshan', 'Sunrise at the beach', 'Konark day trip', 'Chilika boat excursion']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'odisha'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[10, 11, 12, 1, 2], 'Mild and sea-breezy.', ARRAY['Beach', 'Temple', 'Konark'], 'High', 'Budget', 'Excellent', 'Rath Yatra in June-July.', 1
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Hot, humid.', ARRAY['Dawn beach', 'Temple mornings'], 'Low', 'Budget', 'Fair', '', 2
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8, 9], 'Heavy sea, rain.', ARRAY['Seafood shacks', 'Chilika'], 'Low', 'Budget', 'Fair', 'Beach swimming unsafe in swell.', 3
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jagannath Temple', 'The 12th-century shrine and dining hall behind the sacred precinct.', 'church', 'Spiritual', ARRAY['any'], ARRAY[1, 2, 3, 4, 10, 11, 12], false, ARRAY['clear', 'any'], 1
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sunrise at Puri Beach', 'Blue Flag beach with rolling morning surf.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Konark Sun Temple', 'A 13th-century chariot-temple of the sun, a World Heritage jewel.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Chilika Lake Cruise', 'Asia''s largest brackish lagoon with Irrawaddy dolphins.', 'boat', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Puri+Beach', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Puri+Beach', 'Puri beach at sunrise', 'Placeholder', 'CC0', NULL, NULL, 'beach', 1
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Konark+Sun+Temple', 'https://placehold.co/900x600/334155/e2e8f0?text=Konark+Sun+Temple', 'Konark sun temple wheel', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'puri'
ON CONFLICT DO NOTHING;

-- ---- Khajuraho (madhya_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Khajuraho', 'khajuraho', 'destination', 'The Chandela temple ensemble — India''s greatest sculptural gallery.', 'A UNESCO group of Nagara-style temples built 950-1050 CE, served obliquely by Chhatarpur rail and Khajuraho airport (limited flights). The Western Group''s dance figures and the sound-and-light show are unmissable.', 24.8318, 79.9199, 282, ARRAY['Heritage', 'Architecture', 'Photography'], ARRAY['Winter', 'Post-Monsoon', 'Summer'], ARRAY[1, 2, 11, 12], '2-3 days', 'Budget', 72, false, ARRAY['Bhutte ka kees', 'Dal bafla', 'Chhena'], ARRAY['Khajuraho Dance Festival', 'Mahashivratri'], ARRAY['Western group guided tour', 'Dawn photography at Lakshmana', 'Dance festival in Feb/March', 'Panna tiger reserve detour']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'madhya_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Peak', ARRAY[11, 12, 1, 2], 'Clear cool days for temple touring.', ARRAY['Temple walks', 'Dance festival', 'Photography'], 'High', 'Budget', 'Excellent', 'Feb dance festival is the highlight.', 1
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm, thinner crowds.', ARRAY['Temple walks', 'Chhatarpur markets'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Rain, mould on stone.', ARRAY['Interiors', 'Museum'], 'Very Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Western Group Temples', 'The sculptural perfection of Kandariya Mahadeo under dawn or dusk light.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sound & Light Show', 'Narration of temple lore projected over the western group at night.', 'music', 'Cultural', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Khajuraho Dance Festival', 'Classical Bharatanatyam and Kathak against the temple backdrop.', 'music', 'Cultural', ARRAY['any'], ARRAY[2, 3], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Raneh Falls & Ken River', 'A granite-canyon gorge 18 km out with stepping-stone cascades.', 'water', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Khajuraho+Temples', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Khajuraho+Temples', 'Kandariya Mahadeo temple', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'khajuraho'
ON CONFLICT DO NOTHING;

-- ---- Pachmarhi (madhya_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Pachmarhi', 'pachmarhi', 'destination', 'The satpura plateau''s emerald canopy — MP''s only hill station.', 'Dense forest, honeycomb caves and sandstone stacks set a thousand metres up, 210 km from Jabalpur rail. Bee Falls, Jatashankar caves and the sunset point of Dhoopgarh make it a quiet 2-3 day retreat.', 22.4677, 78.4337, 1067, ARRAY['Hill Station', 'Forest', 'Caves', 'Offbeat'], ARRAY['Winter', 'Post-monsoon', 'Summer'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Budget', 48, true, ARRAY['Bhopali', 'Boondi', 'Forest honey'], ARRAY['Pachmarhi Utsav', 'Shivratri caves fair'], ARRAY['Dhoopgarh sunset', 'Bee falls', 'Jatashankar cave', 'Pandava caves'' guides']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'madhya_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Dry Winter', ARRAY[10, 11, 12, 1, 2], 'Crisp air, clear views.', ARRAY['Waterfalls', 'Viewpoints', 'Cave walks'], 'Medium', 'Budget', 'Excellent', 'Forest gates hours limited.', 1
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8, 9], 'Drenched satpura greenery.', ARRAY['Bee falls in spate', 'Misty trails'], 'Low', 'Budget', 'Good', 'Waterlogged paths.', 2
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Hot but greener shade.', ARRAY['Morning viewpoints'], 'Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dhoopgarh Sunset', 'The highest point of the Satpuras with layered ridge views.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bee Falls', 'A chute of water into a ferns-laced pool.', 'water', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 7, 8], false, ARRAY['clear', 'rainy'], 2
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jatashankar Cave', 'A mythology-steeped cave beneath overhanging rock.', 'tent', 'Spiritual', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Pandava Caves & Handi Khoh', 'Rock-cut shelters and a two-sided gorge viewpoint.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pachmarhi+Satpura', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pachmarhi+Satpura', 'Forest ridge at Pachmarhi', 'Placeholder', 'CC0', NULL, NULL, 'hill_station', 1
FROM public.destinations d WHERE d.slug = 'pachmarhi'
ON CONFLICT DO NOTHING;

-- ---- Bhimbetka (madhya_pradesh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Bhimbetka', 'bhimbetka', 'destination', 'A cave gallery of some of humanity''s oldest rock paintings.', 'Over 700 rock shelters with paintings that span 100,000 years of human art, 45 km from Bhopal air/rail. A half-day site visit with the famous ''boar hunt'' panel — a quiet, extraordinary hidden gem.', 22.9403, 77.6128, 428, ARRAY['Heritage', 'Prehistoric', 'Offbeat', 'Photography'], ARRAY['Winter', 'Post-monsoon', 'Monsoon'], ARRAY[10, 11, 12, 1, 2], '2-3 days', 'Budget', 46, true, ARRAY['Bhopali', 'Shami kebabs'], ARRAY['International Rock Art Festival'], ARRAY['Audio-guided tribal tour', 'Auditorium cave trace', 'Bhopal museums tie-in']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'madhya_pradesh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Prime', ARRAY[10, 11, 12, 1, 2], 'Cool and clear for shelter walks.', ARRAY['Rock art tour', 'Audio guide'], 'Low', 'Budget', 'Excellent', 'Open sunrise to sunset minus Mondays.', 1
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10], 'Green surrounds post-monsoon.', ARRAY['Photography'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Rain keeps shelters slippery.', ARRAY['Interior shelters'], 'Very Low', 'Budget', 'Fair', 'Shells out into the rain.', 3
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Guided Rock Art Walk', 'Drinker-bull and boar-hunt panels across the Buffer Zone shelters.', 'palmtree', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Auditorium Rock Shelter', 'The largest shelter, named for its acoustically rich bell chamber.', 'tent', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bhopal Museum Tie-in', 'See excavated tools and the ancestry of the paintings in Bhopal.', 'landmark', 'Cultural', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], true, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Bhimbetka+Rock+Art', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Bhimbetka+Rock+Art', 'Rock shelter painting gallery', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'bhimbetka'
ON CONFLICT DO NOTHING;

-- ---- Ahmedabad (gujarat) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Ahmedabad', 'ahmedabad', 'destination', 'Gandhi''s Sabarmati city — a World Heritage walled heart.', 'The first UNESCO-listed Indian city, on the Sabarmati with a modern metro and full air/rail connectivity. Pol houses, the Sabarmati Ashram and street food anchor the experience.', 23.0225, 72.5714, 53, ARRAY['Heritage', 'Architecture', 'Culinary', 'Culture'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2], '2-3 days', 'Budget', 66, false, ARRAY['Khaman', 'Fafda jalebi', 'Undhiyu'], ARRAY['Rann Utsav (Kutch)', 'Uttarayan kite festival'], ARRAY['Old city pol walk', 'Sabarmati Ashram', 'Manek Chowk night food', 'Adalaj stepwell detour']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'gujarat'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Clear sunny days, bracing nights.', ARRAY['Pol walks', 'Ashram', 'Street food'], 'High', 'Budget', 'Excellent', 'Kite festival Jan 14.', 1
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Pleasant dry heat.', ARRAY['Museum hours'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Warm, occasional showers.', ARRAY['Heritage interiors'], 'Low', 'Budget', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Old City Pol House Walk', 'Latitude of carved wooden havelis and bird feeders in the walled quarter.', 'building', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sabarmati Ashram', 'Gandhi''s 1917 riverside base and the Dandi march''s starting point.', 'leaf', 'Heritage', ARRAY['any'], ARRAY[1, 2, 3, 4, 10, 11, 12], false, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Manek Chowk Food Night', 'Jewellers by day; hive of egg and jalebi stalls by night.', 'utensils', 'Culinary', ARRAY['any'], ARRAY[1, 2, 3, 4, 10, 11, 12], true, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Adalaj Stepwell', 'Intricate ornate well five storeys deep, 20 km north.', 'water', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Ahmedabad+Adalaj', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Ahmedabad+Adalaj', 'Adalaj stepwell', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'ahmedabad'
ON CONFLICT DO NOTHING;

-- ---- Rann of Kutch (gujarat) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Rann of Kutch', 'rann_of_kutch', 'destination', 'The white salt desert — India''s photogenic winter moonland.', 'A seasonal salt marsh of the Great Rann, 90 km from Bhuj airport via Dholavira/Mandvi roads. The Rann Utsav (Nov-Feb) brings tents, crafts and full-moon rituals to the white desert.', 23.7333, 69.8333, 2, ARRAY['Desert', 'Festival', 'Photography', 'Crafts'], ARRAY['Winter', 'Spring'], ARRAY[11, 12, 1, 2], '2-3 days', 'Moderate', 70, false, ARRAY['Kutchi dabeli', 'Bhuj khari', 'Sindhi kadhi'], ARRAY['Rann Utsav', 'Banni embroidery melas'], ARRAY['White-camel safari', 'Full-moon mirror shots', 'Kala Dungar viewpoint', 'Bhuj bandhni bazaars']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'gujarat'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Utsav Winter', ARRAY[11, 12, 1, 2], 'Crisp desert nights, dry salt.', ARRAY['Camel rides', 'Starlight camps', 'Craft tents'], 'Very High', 'Moderate', 'Excellent', 'Full-moon weekends booked out.', 1
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Heat builds; desert still white.', ARRAY['Day photography'], 'Low', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon No-Go', ARRAY[7, 8, 9], 'Naan floods; road submerged.', ARRAY['Film on Kutch interiors'], 'Very Low', 'Budget', 'Poor', 'Avoid entirely.', 3
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'White Desert Sunset', 'Salt pan magenta light and mirror photography at dusk.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kala Dungar Viewpoint', 'The Rann''s only hill with a 360-degree white horizon.', 'mountain', 'Photography', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Banni Craft Villages', 'Embroidery, bell-making and leatherwork hamlets of the Banni belt.', 'hand', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'White Camel Safari', 'A species of albino camel trotting the dry salt crust.', 'camel', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 4
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rann+of+Kutch', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rann+of+Kutch', 'White salt desert at sunset', 'Placeholder', 'CC0', NULL, NULL, 'desert', 1
FROM public.destinations d WHERE d.slug = 'rann_of_kutch'
ON CONFLICT DO NOTHING;

-- ---- Gir National Park (gujarat) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Gir National Park', 'gir', 'destination', 'The last wild home of the Asiatic lion.', 'A teak flat-forest park 60 km from Junagadh and 350 km from Rajkot airport. Lion safaris are booked online through Sasan Gir; jeeps comb the dry teak for the park''s 600+ lions and a full cat graveyard of prey.', 21.1241, 70.8233, 159, ARRAY['Wildlife', 'Lion Safari', 'Forest'], ARRAY['Summer', 'Winter Safari'], ARRAY[4, 5, 6, 11, 12, 1, 2], '2-3 days', 'Moderate', 74, false, ARRAY['Kutchi thali', 'Surati undhiyu'], ARRAY['Girnar fair (Junagadh)'], ARRAY['Daybreak lion safari', 'Sasan Gir crocodile pool', 'Kankai Mata temple plateau', 'Girnar temple climb']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'gujarat'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Prime Winter', ARRAY[11, 12, 1, 2], 'Cool clear visibility in open teak.', ARRAY['Jeep safaris', 'Birding'], 'High', 'Moderate', 'Great', 'Book lion-safari jeeps on the official portal.', 1
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Hot Summer', ARRAY[4, 5, 6], 'Lions gather at waterholes.', ARRAY['Late safaris at water'], 'Medium', 'Moderate', 'Good', 'Heat is brutal; use closed-jacket safari.', 2
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Closed', ARRAY[7, 8, 9], 'Park shut for breeding.', ARRAY['Buffer-zone walks'], 'Very Low', 'Budget', 'Poor', 'Closed mid-June to mid-Oct.', 3
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Asiatic Lion Safari', 'Gir''s raison d''etre — licensed jeep or canter with trackers.', 'animal', 'Wildlife', ARRAY['any'], ARRAY[12, 1, 2, 3, 4, 5, 6, 10, 11], false, ARRAY['clear', 'sunny'], 1
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Crocodile Center & Sasan', 'Observation point teeming with muggers near the HQ village.', 'fish', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kamleshwar Dam Zone', 'Photographic pastures of open water in the regulated sanctuary.', 'water', 'Wildlife', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Girnar Hill Excursion', 'Mountain temple climb and Jain derivation views near Junagadh.', 'mountain', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gir+Lion', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gir+Lion', 'Asiatic lion in dry teak', 'Placeholder', 'CC0', NULL, NULL, 'wildlife', 1
FROM public.destinations d WHERE d.slug = 'gir'
ON CONFLICT DO NOTHING;

-- ---- Mumbai (maharashtra) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Mumbai', 'mumbai', 'destination', 'The city that never sleeps — gothic arches, sea-drives and street food.', 'India''s financial and film capital on the Arabian Sea, with its own dense airport web and full rail. Gateway of India, Marine Drive, the CSMT gothic quarter and king-prawn fry define it.', 19.076, 72.8777, 6, ARRAY['City Life', 'Heritage', 'Culinary', 'Nightlife'], ARRAY['Winter', 'Monsoon', 'Post-monsoon'], ARRAY[11, 12, 1, 2, 9, 10], '2-3 days', 'Moderate', 84, false, ARRAY['Vada pav', 'Pav bhaji', 'Bombay duck fry'], ARRAY['Ganesh Chaturthi', 'Kala Ghoda Arts Festival'], ARRAY['Gateway to Colaba walk', 'Ferry to Elephanta caves', 'Marine Drive sunset', 'CSMT by night']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'maharashtra'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Pleasant sea breeze, clear.', ARRAY['City walks', 'Island ferries', 'Night drives'], 'High', 'Moderate', 'Great', 'Best big-city window.', 1
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Post-Monsoon', ARRAY[9, 10], 'Green and mild.', ARRAY['Kala Ghoda', 'Beach morning'], 'Medium', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[6, 7, 8], 'Sea lanes and showers.', ARRAY['Coffee marches, museum days'], 'Medium', 'Moderate', 'Fair', 'High tide hustle.', 3
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Gateway of India & Colaba', 'Basalt triumphal arch built 1924, hub of harbour life.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Elephanta Island Caves', 'A ferry to 5th-7th-century Shiva rock-cut caves.', 'boat', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Marine Drive at Dusk', 'The queen''s necklace neon sweep along the bay.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bade Miya & Bhendi Bazaar', 'Legendary late-night kebab and biryani lanes.', 'utensils', 'Culinary', ARRAY['any'], ARRAY[11, 12, 1, 2], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gateway+of+India', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gateway+of+India', 'Gateway of India waterfront', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'mumbai'
ON CONFLICT DO NOTHING;

-- ---- Lonavala (maharashtra) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Lonavala', 'lonavala', 'destination', 'The Sahyadri''s weekend monsoon chai-stop — forts, lakes and caves.', 'A plateau-side station between Mumbai and Pune with a tiny airstrip hub via Pune (65 km). Karla-Ellora caves, Lion''s Point and monsoon slips of the Western Ghats at 620 m keep it eternally popular.', 18.7551, 73.4039, 622, ARRAY['Monsoon', 'Hill Station', 'Weekend', 'Caves'], ARRAY['Monsoon', 'Winter', 'Summer'], ARRAY[7, 8, 9, 11, 12, 1, 2], '2-3 days', 'Budget', 58, false, ARRAY['Chikki', 'Mango mastani', 'Vada pav'], ARRAY['Bombay Chikoo festival', 'Ganesh'], ARRAY['Karla Caves early morn', 'Bhushi dam splash', 'Tiger''s leap viewpoint', 'Lonavala chikki run']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'maharashtra'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Prime', ARRAY[7, 8, 9], 'Waterfalls crash the escarpment.', ARRAY['Dam splash', 'Mist viewpoints'], 'Very High', 'Budget', 'Great', 'Weekend traffic heavy.', 1
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Crisp clear Punjab-like skies.', ARRAY['Fort hikes', 'Pune day trips'], 'Medium', 'Budget', 'Great', '', 2
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[3, 4, 5], 'Dry and hot.', ARRAY['Caves', 'Pool resorts'], 'Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Bhushi Dam Waterfall', 'Gushing stair-runs of the monsoon wall.', 'water', 'Leisure', ARRAY['any'], ARRAY[7, 8, 9], false, ARRAY['rainy', 'overcast'], 1
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Karla & Bhaja Caves', 'Ancient Brahmanical caves with granite prayer-hall frontage.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tiger''s Leap & Lion''s Point', 'Scalloped viewpoints over the Western Ghats escarpment.', 'mountain', 'Photography', ARRAY['any'], ARRAY[7, 8, 9, 10, 11, 12, 1], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Duke''s Nose Trek', 'A bluff-shaped ledge climb above the old Mumbai-Pune road.', 'mountain', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Lonavala+Monsoon', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Lonavala+Monsoon', 'Western ghats escarpment in rain', 'Placeholder', 'CC0', NULL, NULL, 'monsoon', 1
FROM public.destinations d WHERE d.slug = 'lonavala'
ON CONFLICT DO NOTHING;

-- ---- Goa (goa) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Goa', 'goa', 'destination', 'India''s beach classic — 100 km of coast, churches and cashew sunsets.', 'A land of coconut palms and Portuguese churches between the Arabian Sea and the Western Ghats, reached through its own international airport, Madgaon rail and the Konkan route. Beach shacks, night markets and easy living define it.', 15.4909, 73.8278, 4, ARRAY['Beach', 'Nightlife', 'Portuguese Heritage', 'Water Sports'], ARRAY['Winter Peak', 'Shoulder', 'Monsoon'], ARRAY[11, 12, 1, 2, 3, 10], '2-3 days', 'Moderate', 88, false, ARRAY['Fish curry rice', 'Xacuti', 'Feni'], ARRAY['Sunburn', 'Carnaval', 'Shigmo'], ARRAY['Vagator & Anjuna sunsets', 'Old Goa churches', 'Dudhsagar falls train', 'North-south beach hop']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'goa'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[11, 12, 1, 2], 'Sunny dry days, crisp evenings.', ARRAY['Beaches', 'Water sports', 'Parties'], 'Very High', 'Moderate', 'Excellent', 'Holiday pricing.', 1
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Shoulder', ARRAY[3, 4, 10], 'Warm, calmer, cheaper.', ARRAY['Shacks', 'Sunset cruises'], 'Medium', 'Moderate', 'Good', 'Best value.', 2
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[6, 7, 8], 'Green canopy, beaches roar.', ARRAY['Old Goa', 'Rainy cafes'], 'Low', 'Budget', 'Fair', 'Shacks closed; falls awesome.', 3
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Anjuna & Vagator Sunsets', 'Red-cliff views and flea markets behind the beach.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Old Goa Heritage Circuit', 'Basilica of Bom Jesus and whitewashed cathedral complexes.', 'church', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dudhsagar Waterfall', 'A four-tier cascade reachable by train crossing over the gorge.', 'water', 'Adventure', ARRAY['any'], ARRAY[9, 10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Water Sports at Calangute', 'Banana rides, parasailing and jet-ski on the state''s busiest beach.', 'waves', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear', 'sunny'], 4
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Goa+Beach', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Goa+Beach', 'Goa coastline at sunset', 'Placeholder', 'CC0', NULL, NULL, 'beach', 1
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Old+Goa', 'https://placehold.co/900x600/334155/e2e8f0?text=Old+Goa', 'Basilica of Bom Jesus', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 2
FROM public.destinations d WHERE d.slug = 'goa'
ON CONFLICT DO NOTHING;

-- ---- Mysuru (karnataka) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Mysuru', 'mysuru', 'destination', 'The sandalwood city of palaces and puja-lit streets.', 'Two hours from Bengaluru airport/rail on the NH275, Mysuru''s Amber-lit palace, Devaraja market and the Chamundi hill view make a courtly classic. The Dussehra festival is its crown.', 12.2958, 76.6394, 770, ARRAY['Heritage', 'Palaces', 'Festivals', 'Culture'], ARRAY['Winter', 'Dussehra', 'Spring'], ARRAY[9, 10, 11, 12, 1, 2], '2-3 days', 'Budget', 70, false, ARRAY['Mysore masala dosa', 'Obbattu', 'Mysore pak'], ARRAY['Mysuru Dasara', 'Tithi of the fabric'], ARRAY['Palace sound-light show', 'Chamundi hill steps', 'Srirangapatna detour', 'Dussehra procession (Oct)']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'karnataka'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Mild, palace-truth days.', ARRAY['Palace', 'Chamundi', 'Bazaars'], 'High', 'Budget', 'Excellent', '', 1
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Dussehra Fortnight', ARRAY[9, 10], 'Jumbo procession and night illumination.', ARRAY['Procession', 'Crafts fair'], 'Very High', 'Moderate', 'Good', 'Book ahead.', 2
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[3, 4, 5], 'Hot dry.', ARRAY['Museums', 'Brindavan evening'], 'Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mysore Palace', 'The Amba Vilas interiors lit on Sundays and during Dasara.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Chamundi Hill Temple', 'Thousands of steps and a giant Nandi above the city.', 'church', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Devaraja Market', 'Garlands, turmeric heaps and spice mountains in the heart of town.', 'shopping', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2], true, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Brindavan Gardens', 'Water-dance fountain show at Krishnaraja Sagar dam, 20 km out.', 'water', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mysuru+Palace', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Mysuru+Palace', 'Mysore palace at dusk', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'mysuru'
ON CONFLICT DO NOTHING;

-- ---- Hampi (karnataka) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Hampi', 'hampi', 'destination', 'The stone-boulder capital of the Vijayanagara empire.', 'A World Heritage landscape of granite boulders and temple masonry on the Tungabhadra, 350 km from Bengaluru and 12 km from Hospet rail. Virupaksha temple, the boulder hills and Coracle rides define it.', 15.335, 76.46, 467, ARRAY['Heritage', 'Ruins', 'Boulder Country', 'Spiritual'], ARRAY['Winter', 'Post-Monsoon', 'Summer'], ARRAY[11, 12, 1, 2], '2-3 days', 'Budget', 74, false, ARRAY['Bisi bele bath', 'Hampi street banana dosa', 'Tender coconut'], ARRAY['Hampi Utsav', 'Coracle regatta'], ARRAY['Coracle crossing to Anegundi', 'Matanga hill sunset', 'Golden Chariot sunrise', 'Vijaya Vittala court']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'karnataka'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Prime Winter', ARRAY[11, 12, 1, 2], 'Clear cool boulder light.', ARRAY['Temple circuit', 'Hill sunsets', 'Coracle'], 'High', 'Budget', 'Excellent', 'Carry water; site is vast.', 1
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Post-Monsoon', ARRAY[9, 10], 'Green against grey granite.', ARRAY['Photography', 'Lotus tanks'], 'Low', 'Budget', 'Great', '', 2
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Boulder heat brutal.', ARRAY['Sunrise only'], 'Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Vijaya Vittala Temple', 'The stone chariot and the 56-pillar musical hall.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Virupaksha Temple & Bazaar', 'The city''s working temple enclosing daily puja at its gate.', 'church', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Matanga Hill Sunset', 'Scramble for the full boulder-field and temple panorama.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Coracle on the Tungabhadra', 'Round woven-bamboo ferries to the far bank.', 'boat', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Hampi+Stone+Chariot', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Hampi+Stone+Chariot', 'Stone chariot at Vijaya Vittala', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'hampi'
ON CONFLICT DO NOTHING;

-- ---- Coorg (karnataka) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Coorg', 'coorg', 'destination', 'Madikeri — Karnataka''s coffee country of misty estates and waterfalls.', 'A coffee-and-pepper Western Ghats hill country 250 km from Bengaluru, entered via Madikeri town. Abbey falls, Raja''s seat and plantation stays in the emerald canopy make it a classic monsoon-lovers'' retreat.', 12.4244, 75.7382, 1170, ARRAY['Coffee Country', 'Hill Station', 'Monsoon', 'Plantations'], ARRAY['Monsoon', 'Winter', 'Autumn'], ARRAY[12, 1, 2, 3, 7, 8, 9], '2-3 days', 'Moderate', 62, false, ARRAY['Pandi curry', 'Kadambuttu', 'Coffee'], ARRAY['Kavery Sankramana', 'Madikeri Dasara'], ARRAY['Abbey falls monsoon', 'Plantation guided walk', 'Raja''s seat sunset', 'Talacauvery origin spring']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'karnataka'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Glory', ARRAY[7, 8, 9], 'Falls at full strength.', ARRAY['Abbey falls', 'Mist drives'], 'Low', 'Moderate', 'Good', 'Best for greenery.', 1
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Crisp clear plantation air.', ARRAY['Estate walks', 'Coffee tastings'], 'High', 'Moderate', 'Excellent', 'Harvest season.', 2
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4, 5], 'Dry, light.', ARRAY['Viewpoints', 'National parks'], 'Medium', 'Moderate', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Abbey Falls', 'Whitewater tumbling through banana-green cliffs.', 'water', 'Leisure', ARRAY['any'], ARRAY[7, 8, 9, 10], false, ARRAY['rainy', 'clear'], 1
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Coffee Plantation Walk', 'Arabica fields, pepper creepers and a shade canopy tour.', 'leaf', 'Culinary', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Raja''s Seat Sunset', 'A colonnaded viewpoint over the river valley.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[1, 12, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Talacauvery & Bhagamandala', 'The Kaveri''s origin shrine and the triveni confluence.', 'water', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Coorg+Coffee', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Coorg+Coffee', 'Coffee estate at Coorg', 'Placeholder', 'CC0', NULL, NULL, 'coffee', 1
FROM public.destinations d WHERE d.slug = 'coorg'
ON CONFLICT DO NOTHING;

-- ---- Gokarna (karnataka) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Gokarna', 'gokarna', 'destination', 'A pilgrim town of holy coves and India''s strongest breezes.', 'A temple town on the Karnataka coast 150 km from Mangalore/air-rail. Om, Kudle and Half Moon beaches behind the monkey-hills make a rough-roads classic of the hippie route north.', 14.5488, 74.3178, 15, ARRAY['Beach', 'Offbeat', 'Trekking', 'Spiritual'], ARRAY['Winter', 'Shoulder', 'Monsoon'], ARRAY[11, 12, 1, 2, 10], '2-3 days', 'Budget', 56, false, ARRAY['Tandoori', 'Sunset fish', 'Banana pancakes'], ARRAY['Shiva Rathotsava', 'Mahabaleshwar fair'], ARRAY['Om beach sunrise', 'Cliff coast to Half Moon', 'Maha Ganapati puja', 'Beach bonfires']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'karnataka'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[11, 12, 1, 2], 'Golden dry dunes.', ARRAY['Beach cafés', 'Cove hikes'], 'High', 'Budget', 'Excellent', 'Cramped in peak tents.', 1
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Shoulder', ARRAY[3, 4, 10], 'Mild, quiet.', ARRAY['Bonfires', 'Yoga'], 'Low', 'Budget', 'Great', 'Best value.', 2
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[6, 7, 8], 'Sea rises; some beaches close.', ARRAY['Temple town', 'Rain walks'], 'Low', 'Budget', 'Fair', 'Swimming unsafe.', 3
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Om Beach Panorama', 'A double-cove in the shape of the sacred syllable.', 'sunrise', 'Photography', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Cliff Coast Loop', 'Trail over the headland to Kudle, Half Moon & Paradise.', 'walk', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mahabaleshwar Temple', 'Atma-linga shrine where pilgrims break the beach day.', 'church', 'Spiritual', ARRAY['any'], ARRAY[1, 2, 3, 4, 11, 12], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Beach Bonfire Nights', 'Drum circles and cliff obelisk sunsets by the coves.', 'music', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gokarna+Om+Beach', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Gokarna+Om+Beach', 'Om beach double cove', 'Placeholder', 'CC0', NULL, NULL, 'beach', 1
FROM public.destinations d WHERE d.slug = 'gokarna'
ON CONFLICT DO NOTHING;

-- ---- Munnar (kerala) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Munnar', 'munnar', 'destination', 'The Western Ghats'' tea-country basin of rolling emerald slopes.', 'Kerala''s most famous hill station at 1,700 m, 108 km from Kochi airport. Tea museum, Eravikulam and top-station viewpoints make the loop while the monsoons bring the mists that folk songs celebrate.', 10.0889, 77.0595, 1700, ARRAY['Tea', 'Hill Station', 'Monsoon', 'Wildlife'], ARRAY['Monsoon', 'Winter', 'Autumn'], ARRAY[12, 1, 2, 7, 8, 9], '2-3 days', 'Moderate', 82, false, ARRAY['Kerala sadya', 'Tea estate snacks', 'Puttu kadala'], ARRAY['Onam', 'Attukal Pongala'], ARRAY['Tea factory tour', 'Eravikulam lookout', 'Mattupetty reservoir', 'Top Station drive']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'kerala'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Crisp 8C-20C, clear ridges.', ARRAY['Tea estates', 'Eravikulam', 'Boating'], 'High', 'Moderate', 'Excellent', 'Best.', 1
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon Mists', ARRAY[7, 8, 9], 'Weather wraps the slopes.', ARRAY['Tea houses', 'Waterfalls'], 'Low', 'Moderate', 'Good', 'Landslides rare but check roads.', 2
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Muck clears for views.', ARRAY['Photography', 'Trekking'], 'Low', 'Moderate', 'Excellent', '', 3
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Tea Museum & Factory', 'Withering, rolling and CTC machinery in a working estate.', 'leaf', 'Culinary', ARRAY['any'], ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], true, ARRAY['any'], 1
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Eravikulam National Park', 'The nilgiri tahr''s sanctuary and Rajamala shola walks.', 'animal', 'Wildlife', ARRAY['any'], ARRAY[1, 2, 3, 4, 9, 10, 11, 12], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Mattupetty & Kundala', 'Boating and the dam loop amid pine plantations.', 'boat', 'Leisure', ARRAY['any'], ARRAY[1, 2, 3, 4, 9, 10, 11, 12], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Top Station Viewpoint', 'The Western Ghats staircase at the Tamil Nadu border.', 'mountain', 'Photography', ARRAY['any'], ARRAY[9, 10, 11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Munnar+Tea', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Munnar+Tea', 'Tea slope at Munnar', 'Placeholder', 'CC0', NULL, NULL, 'tea', 1
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/334155/e2e8f0?text=Munnar+Mist', 'https://placehold.co/900x600/334155/e2e8f0?text=Munnar+Mist', 'Misty Munnar shola', 'Placeholder', 'CC0', NULL, NULL, 'hill_station', 2
FROM public.destinations d WHERE d.slug = 'munnar'
ON CONFLICT DO NOTHING;

-- ---- Kochi (kerala) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Kochi', 'kochi', 'destination', 'Fort Kochi — a spice-soaked colonial port of Chinese nets and Dutch lanes.', 'Kerala''s Arabian-Sea gateway with a bustling international airport and rail port. The Jewish quarter, dutch warehouses, Chinese fishing nets and Kathakali evenings stitch centuries of trade into one walkable quarter.', 9.9312, 76.2673, 2, ARRAY['Heritage', 'Port City', 'Culinary', 'Backwaters'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2, 3], '2-3 days', 'Moderate', 76, false, ARRAY['Karimeen pollichathu', 'Appam stew', 'Copper-wire tea'], ARRAY['Fort Kochi art fest', 'Indus-style Xmas'], ARRAY['Chinese nets at dawn', 'Jewish synagogues', 'Kathakali evening', 'Marine drive boat jetty']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'kerala'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Sea-breeze warm, dry.', ARRAY['Heritage walks', 'Island ferries'], 'High', 'Moderate', 'Excellent', 'Xmas lights lovely.', 1
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm but fine.', ARRAY['Cafes', 'Art galleries'], 'Low', 'Moderate', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[6, 7, 8], 'Rainy port days.', ARRAY['Museum & theatre'], 'Low', 'Moderate', 'Fair', 'Nets hauled often.', 3
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Chinese Fishing Nets', 'Teak-and-stone mechanism still hauling on the Fort Kochi shore.', 'fish', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jewish Quarter & Synagogue', 'The Paradesi synagogue''s blue Cantonese tiles and whitewashed lanes.', 'church', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Kathakali Theatre Evenings', 'Full make-up demonstration and classical performance in Fort Kochi.', 'music', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], true, ARRAY['any'], 3
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Island Ferry to Vypeen', 'The working harbour crossing and ghat-side heat.', 'boat', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Fort+Kochi+Nets', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Fort+Kochi+Nets', 'Chinese fishing nets at Kochi', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'kochi'
ON CONFLICT DO NOTHING;

-- ---- Alleppey (kerala) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Alleppey', 'alleppey', 'destination', 'The Venice of the East — Kerala''s backwater heart.', 'A canal-crossed town 53 km south of Kochi airport which summons the palm-shadowed backwater runs. A houseboat night, the Punnamada lake and the Alappuzha beach make the quintessential Kerala postcard.', 9.4981, 76.3388, 3, ARRAY['Backwaters', 'Houseboat', 'Monsoon', 'Beach'], ARRAY['Winter', 'Monsoon', 'Post-monsoon'], ARRAY[11, 12, 1, 2, 7, 8, 9], '2-3 days', 'Moderate', 80, false, ARRAY['Sadya', 'Karimeen', 'Tender coconut'], ARRAY['Nehru Trophy boat race', 'Onam'], ARRAY['Houseboat overnight', 'Early canal cycle', 'Punnamada boat races', 'Alappuzha lighthouse']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'kerala'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Dry sunny backwater days.', ARRAY['Houseboats', 'Canal rides'], 'High', 'Moderate', 'Excellent', 'Book boats early.', 1
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8, 9], 'Rains feed the waters, quiet.', ARRAY['Green canal cruises'], 'Low', 'Moderate', 'Good', 'Boat prices dip.', 2
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10], 'Nice between rains.', ARRAY['Houseboat', 'Village walks'], 'Low', 'Moderate', 'Excellent', '', 3
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Overnight Houseboat', 'Kettuvallam rice-barge on a palm-laced inland route.', 'boat', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'rainy'], 1
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Punnamada Canal Rides', 'Silent country boats through village waterways.', 'boat', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Nehru Trophy Boat Race', 'The snake-boat regatta on the second August Saturday.', 'waves', 'Cultural', ARRAY['any'], ARRAY[8], false, ARRAY['rainy', 'clear'], 3
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Alappuzha Beach & Lighthouse', 'The shore end of the backwater country.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Alleppey+Backwaters', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Alleppey+Backwaters', 'Houseboat on the backwaters', 'Placeholder', 'CC0', NULL, NULL, 'backwaters', 1
FROM public.destinations d WHERE d.slug = 'alleppey'
ON CONFLICT DO NOTHING;

-- ---- Varkala (kerala) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Varkala', 'varkala', 'destination', 'Kerala''s cliffs-and-coves beach town of sunset cafés.', 'A mineral-red cliff beach 55 km north of Thiruvananthapuram airport and 43 km from Varkala rail. The 40-ft cliff-top promenade, Papanasam beach and occupational funky cafés make it the state''s bohemian favourite.', 8.7338, 76.708, 60, ARRAY['Beach', 'Cliff', 'Yoga', 'Sunset'], ARRAY['Winter', 'Monsoon', 'Shoulder'], ARRAY[11, 12, 1, 2, 9, 10], '2-3 days', 'Budget', 62, false, ARRAY['Cliff-top juice', 'Fish curry', 'Banana breads'], ARRAY['Varkala beach festival', 'Shivaratri'], ARRAY['Cliff-top sunset walk', 'Papanasam dip', 'Janardhana temple', 'Varkala-Heli ferry']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'kerala'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter Peak', ARRAY[11, 12, 1, 2], 'Gold evenings on the cliff.', ARRAY['Cliff walk', 'Surf school', 'Sunset'], 'High', 'Budget', 'Great', 'Full moon nights buzz.', 1
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[6, 7, 8], 'Rough seas, greener cliffs.', ARRAY['Cafés & yoga'], 'Low', 'Budget', 'Fair', 'Swimming shifts off-season.', 2
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Shoulder', ARRAY[3, 4, 9, 10], 'Quiet, warm.', ARRAY['Surf', 'Ayuveda'], 'Low', 'Budget', 'Excellent', '', 3
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Cliff Promenade Walk', 'Red-laterite path over the beach with whale-watching lookouts.', 'walk', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Papanasam Beach Swim', 'The sacred ''sin-washing'' main beach beneath the cliff.', 'waves', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'sunny'], 2
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sunset Point Cafés', 'The cliff''s sushi-and-smoothie sunset stool culture.', 'coffee', 'Culinary', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Janardhana Temple', 'A 2,000-year-old Vaishnavite shrine by the beach.', 'church', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Varkala+Cliff', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Varkala+Cliff', 'Varkala cliff over the sea', 'Placeholder', 'CC0', NULL, NULL, 'beach', 1
FROM public.destinations d WHERE d.slug = 'varkala'
ON CONFLICT DO NOTHING;

-- ---- Ooty (tamil_nadu) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Ooty', 'ooty', 'destination', 'The queen of the Nilgiris — botanic lawns around a lake.', 'Tamil Nadu''s classic 2,240 m hill station, 88 km from Coimbatore airport and on the Nilgiri Mountain Railway. Botanical gardens, the Rose Garden, the tiny lake and Dodabetta above complete a Victorian original.', 11.4102, 76.695, 2240, ARRAY['Hill Station', 'Tea', 'Gardens', 'Heritage'], ARRAY['Summer', 'Spring', 'Monsoon'], ARRAY[4, 5, 6, 9, 10, 11, 12], '2-3 days', 'Moderate', 72, false, ARRAY['Ooty chox', 'Steamed idlies', 'Sultan biryani (nearby)'], ARRAY['Summer festival', 'Nilgiri winter festival'], ARRAY['Toy train to Mettupalayam', 'Botanical gardens', 'Dodabetta peak', 'Tea factory at Doddabetta']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'tamil_nadu'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Cool days against plains heat.', ARRAY['Gardens', 'Lake boats', 'Toy train'], 'High', 'Moderate', 'Good', 'School rush.', 1
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Clear, blooming.', ARRAY['Photography', 'Viewpoints'], 'Medium', 'Moderate', 'Excellent', 'Best window.', 2
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[12, 1, 2], 'Frost mornings.', ARRAY['Rose garden', 'Tea estates'], 'Low', 'Moderate', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Botanical Gardens', 'Lawns, glass hothouses and a 150-year-old fossil tree.', 'tree-pine', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Nilgiri Mountain Railway', 'A toyl-train run from Ooty through tunnels and tea fields.', 'train', 'Heritage', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11, 12], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dodabetta Peak', 'Highest Nilgiri point (2,637 m) with telescope views.', 'mountain', 'Photography', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ooty Lake Boating', 'A man-made lake ringed by eucalyptus at the town centre.', 'boat', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Ooty+Lake', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Ooty+Lake', 'Ooty lake and green hills', 'Placeholder', 'CC0', NULL, NULL, 'hill_station', 1
FROM public.destinations d WHERE d.slug = 'ooty'
ON CONFLICT DO NOTHING;

-- ---- Kodaikanal (tamil_nadu) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Kodaikanal', 'kodaikanal', 'destination', 'The princess of hill stations — a star-shaped lake amid shola forests.', 'A 2,133 m plateau town 100 km from Madurai rail/air and 205 from Coimbatore. The boat lake, Coaker''s Walk and the pillar-rock viewpoint reward a slow few days.', 10.2381, 77.4892, 2133, ARRAY['Hill Station', 'Lake', 'Forest', 'Honeymoon'], ARRAY['Summer', 'Autumn', 'Monsoon'], ARRAY[4, 5, 6, 9, 10, 11], '2-3 days', 'Moderate', 66, false, ARRAY['Kodai bread', 'Chocolate', 'Curd rice'], ARRAY['Forest festival', 'Summer trip sesh'], ARRAY['Coaker''s Walk', 'Boating the star lake', 'Pillar rocks', 'Guna caves']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'tamil_nadu'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Cool, green and busy.', ARRAY['Lake boating', 'Coaker''s Walk'], 'High', 'Moderate', 'Good', '', 1
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Autumn', ARRAY[9, 10, 11], 'Clear and quiet.', ARRAY['Viewpoints', 'Forest walks'], 'Low', 'Moderate', 'Excellent', 'Best.', 2
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Misted shola rains.', ARRAY['Cafés, lakeside'], 'Low', 'Moderate', 'Fair', 'Trails muddy.', 3
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Star Lake Boating', 'Rowboats on a lake shaped by its basin''s shoreline.', 'boat', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Coaker''s Walk', 'Sunset terrace with a telescope over the plains.', 'walk', 'Leisure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Pillar Rocks & Guna Caves', 'Sheer granite columns and a film-set forest gorge.', 'mountain', 'Photography', ARRAY['any'], ARRAY[4, 5, 6, 9, 10, 11], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Berijam Lake Jeep Ride', 'A forest-department trail to the plateau''s blue lake.', 'car', 'Adventure', ARRAY['any'], ARRAY[4, 5, 6, 9, 10], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Kodaikanal+Lake', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Kodaikanal+Lake', 'Kodaikanal lake', 'Placeholder', 'CC0', NULL, NULL, 'lake', 1
FROM public.destinations d WHERE d.slug = 'kodaikanal'
ON CONFLICT DO NOTHING;

-- ---- Rameswaram (tamil_nadu) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Rameswaram', 'rameswaram', 'destination', 'The southern point where Ram built a causeway — temple sea rhythms.', 'An island at the eastern end of the Pamban bridge (rebuilt rail bridge 2023), 70 km southwest of Madurai airport, reached by a rail line over the sea. Ramanathaswamy temple and Dhanushkodi''s ghost dunes anchor it.', 9.2876, 79.3129, 6, ARRAY['Spiritual', 'Island', 'Beach', 'Heritage'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2], '2-3 days', 'Budget', 56, false, ARRAY['Rameswaram idli', 'Seer fish curry', 'Nippat'], ARRAY['Mahashivratri', 'Deepam'], ARRAY['22 theerthams dip', 'Dhanushkodi remains', 'Pamban bridge drive', 'Agni theertham dawn']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'tamil_nadu'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[11, 12, 1, 2], 'Mild sea winds.', ARRAY['Temple baths', 'Dhanushkodi', 'Beach'], 'High', 'Budget', 'Excellent', '', 1
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Summer', ARRAY[4, 5, 6], 'Hot, humid.', ARRAY['Temple early morning'], 'Low', 'Budget', 'Fair', '', 2
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Gulf storms.', ARRAY['Temple interiors'], 'Low', 'Budget', 'Fair', 'Pamban bridge wind alerts.', 3
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Ramanathaswamy Temple', 'The longest corridor in Hindu temple architecture and 22 ritual tanks.', 'church', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear', 'any'], 1
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Dhanushkodi Ghost Town', 'The cyclone-wrecked 1964 town stranded in white sand.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Pamban Bridge Views', 'Drive or ride over the sea with the old train causeway beside.', 'train', 'Adventure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Agni Theertham Sunrise', 'Ritual dawn dip where the temple meets the sea.', 'sunrise', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rameswaram+Temple', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Rameswaram+Temple', 'Temple corridor at Rameswaram', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'rameswaram'
ON CONFLICT DO NOTHING;

-- ---- Pondicherry (puducherry) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Pondicherry', 'pondicherry', 'destination', 'The white-and-ochre French quarter of gated boulevards and Auroville.', 'A former French colony 150 km from Chennai airport on the TN coast, a 4-hour drive away. Promenade beach, the white quarter, Auroville''s Matrimandir and heritage cafés give it a unique Gallic-South-Indian rhythm.', 11.9416, 79.8083, 3, ARRAY['Heritage', 'French Quarter', 'Beach', 'Spiritual'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2, 3], '2-3 days', 'Budget', 70, false, ARRAY['Baguette croissants', 'Curd rice', 'Sea-food crêperie'], ARRAY['Pondicherry heritage', 'Auroville Xmas'], ARRAY['White town walks', 'Promenade sunset', 'Auroville Matrimandir', 'Serenity beach']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'puducherry'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Mild, breezy.', ARRAY['White town', 'Auroville', 'Beaches'], 'High', 'Budget', 'Excellent', 'Xmas lights beautiful.', 1
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Warm days.', ARRAY['Café terraces', 'Beach mornings'], 'Medium', 'Budget', 'Good', '', 2
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Rainy, humid.', ARRAY['Heritage interiors'], 'Low', 'Budget', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'White Town Heritage Walk', 'Ochre villas, Hindu done-as-French styles and gated boulevards.', 'building', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Auroville Matrimandir', 'The meditative golden sphere of Sri Aurobindo''s community, 12 km out.', 'landmark', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Promenade & White Beach', 'Rocket park and sunrise jogging along the seawall.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Heritage Café Circuit', 'Bakeries and bistros resurrected in the old quarter.', 'coffee', 'Culinary', ARRAY['any'], ARRAY[11, 12, 1, 2], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pondicherry+Quarter', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Pondicherry+Quarter', 'French quarter facade, Pondicherry', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'pondicherry'
ON CONFLICT DO NOTHING;

-- ---- Delhi (delhi) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Delhi', 'delhi', 'destination', 'The layered capital of seven cities — monuments, megamalls and bazaars.', 'India''s gateway, with Indira Gandhi airport, the metro and every rail connection. Red Fort, Qutub Minar, Humayun''s Tomb and the Chandni Chowk anarchy collate 12 centuries in one sprawling canvas.', 28.6139, 77.209, 216, ARRAY['Heritage', 'Monuments', 'Culinary', 'Megacity'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[10, 11, 12, 1, 2, 3], '2-3 days', 'Moderate', 84, false, ARRAY['Chole bhature', 'Butter chicken', 'Paratha wali gali'], ARRAY['Dilli festival', 'Republic Day parade'], ARRAY['Old Delhi rickshaw tour', 'Lodhi gardens sunrise', 'Hauz Khas cafés', 'Metro to Akshardham']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'delhi'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Peak Winter', ARRAY[10, 11, 12, 1, 2, 3], 'Clear but polluted mornings.', ARRAY['Monument circuit', 'Rickshaw bazaars'], 'High', 'Moderate', 'Good', 'Check AQI; mornings can be heavy.', 1
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Blossoming parks.', ARRAY['Garden walks', 'Outdoor markets'], 'Medium', 'Moderate', 'Excellent', 'Best AQI months.', 2
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Humid, flooded streets.', ARRAY['Museums', 'Galleries'], 'Low', 'Moderate', 'Fair', '', 3
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Red Fort & Chandni Chowk', 'A century-old citadel plus the spine of Old Delhi''s markets.', 'castle', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Humayun''s Tomb', 'The garden-tomb grammar that Georgians later copied for the Taj.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Qutub Minar Complex', 'The 73 m victory tower and rust-resistant iron pillar.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[10, 11, 12, 1, 2], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Lodhi Gardens', 'Brilliant sunrise lawns over 15th-century tombs.', 'tree-pine', 'Leisure', ARRAY['any'], ARRAY[10, 11, 12, 1, 2, 3], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Delhi+Qutub', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Delhi+Qutub', 'Qutub Minar', 'Placeholder', 'CC0', NULL, NULL, 'heritage', 1
FROM public.destinations d WHERE d.slug = 'delhi'
ON CONFLICT DO NOTHING;

-- ---- Amritsar (punjab) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Amritsar', 'amritsar', 'destination', 'The Golden Temple''s haloed sanctum and Sikh Punjab''s heart.', 'Punjab''s spiritual capital 25 km from the Wagah border and with rail/air from Delhi. The gilded Harmandir Sahib, Jallianwala Bagh and the border-beating ceremony make a moving 24-48 hours.', 31.634, 74.8723, 234, ARRAY['Spiritual', 'Heritage', 'Sikh Culture', 'Food'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2, 3], '2-3 days', 'Budget', 76, false, ARRAY['Amritsari kulcha', 'Langar', 'Kulfi'], ARRAY['Baisakhi', 'Guru Nanak Jayanti'], ARRAY['Harmandir darshan', 'Langar hall meal', 'Wagah border ceremony', 'Hall Bazaar food street']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'punjab'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Crisp holy-city mornings.', ARRAY['Golden Temple', 'Wordsworth walks'], 'High', 'Budget', 'Excellent', 'Gurpurab lighting is magical.', 1
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Mild and festive (Baisakhi).', ARRAY['Baisakhi processions', 'Food lanes'], 'Medium', 'Budget', 'Excellent', '', 2
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Warm rain.', ARRAY['Temple interiors'], 'Low', 'Budget', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Harmandir Sahib', 'The gold-domed gurdwara mirrored in the Amrit Sarovar tank.', 'church', 'Spiritual', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear', 'any'], 1
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Community Langar', 'The world''s largest free kitchen serving 100,000 meals a day.', 'utensils', 'Cultural', ARRAY['any'], ARRAY[1, 2, 3, 4, 11, 12], true, ARRAY['any'], 2
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Wagah Border Ceremony', 'Twin-nation parade and flag ceremony at dusk, 28 km away.', 'flag', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Jallianwala Bagh', 'The solemn 1919 massacre garden and memorial.', 'landmark', 'Heritage', ARRAY['any'], ARRAY[11, 12, 1, 2], false, ARRAY['clear'], 4
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Golden+Temple', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Golden+Temple', 'Golden temple at night', 'Placeholder', 'CC0', NULL, NULL, 'spiritual', 1
FROM public.destinations d WHERE d.slug = 'amritsar'
ON CONFLICT DO NOTHING;

-- ---- Chandigarh (chandigarh) ----
INSERT INTO public.destinations (region_id, name, slug, kind, summary, description, latitude, longitude, altitude_m, experience_tags, season_tags, best_months, recommended_days, budget_level, popularity, is_hidden_gem, famous_food, festivals, local_experiences)
SELECT r.id, 'Chandigarh', 'chandigarh', 'destination', 'Le Corbusier''s concrete garden city at the Himalayan doorstep.', 'A planned modernist capital at the base of the Shivaliks, where the expressways and cycle grids of Sukhna lake meet. Rock Garden, the Capitol complex and Punjab''s bazaars make it a design-first stop.', 30.7333, 76.7794, 321, ARRAY['Architecture', 'Modernism', 'Parks', 'Weekend'], ARRAY['Winter', 'Spring', 'Monsoon'], ARRAY[11, 12, 1, 2, 3, 9, 10], '2-3 days', 'Budget', 62, false, ARRAY['Butter chicken', 'Paranthe', 'Chandigarh cafe scènes'], ARRAY['Chandigarh Marathon', 'Rock garden festival'], ARRAY['Rock Garden', 'Sukhna lake sunset', 'Capitol complex', 'Sector 17 food plaza']
FROM public.regions r WHERE r.kind IN ('state','union_territory') AND r.slug = 'chandigarh'
ON CONFLICT (region_id, slug) DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Winter', ARRAY[11, 12, 1, 2], 'Crisp, clean Shivalik air.', ARRAY['Rock Garden', 'Lakes', 'Design walks'], 'High', 'Budget', 'Excellent', '', 1
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Spring', ARRAY[3, 4], 'Burgeoning parks.', ARRAY['Cycle rides', 'Open-air cafés'], 'Medium', 'Budget', 'Excellent', '', 2
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_seasons (destination_id, label, months, weather, activities, crowd, budget, rating, notes, sort)
SELECT d.id, 'Monsoon', ARRAY[7, 8], 'Warm and damp.', ARRAY['Museums', 'Le Corbusier buildings'], 'Low', 'Budget', 'Good', '', 3
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Rock Garden', 'Nek Chand''s reclaimed waste-city of mosaic figures and grottos.', 'landmark', 'Architecture', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 1
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Capitol Complex', 'Le Corbusier''s Open Hand, High Court and Assembly buildings.', 'building', 'Architecture', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], false, ARRAY['clear'], 2
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sukhna Lake Sunset', 'The dam lake with Shivalik silhouettes and boating.', 'sunrise', 'Leisure', ARRAY['any'], ARRAY[11, 12, 1, 2, 9, 10], false, ARRAY['clear'], 3
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_activities (destination_id, title, description, icon, experience_tag, season_tags, months, is_indoor, weather_conditions, sort)
SELECT d.id, 'Sector 17 Plaza', 'Corbusier''s shopping square and the city''s food murmur.', 'shopping', 'Cultural', ARRAY['any'], ARRAY[11, 12, 1, 2, 3], true, ARRAY['any'], 4
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

INSERT INTO public.destination_images (destination_id, url, thumb_url, alt, credit, license, source_url, season_tag, category, sort)
SELECT d.id, 'https://placehold.co/900x600/1e293b/e2e8f0?text=Chandigarh+Rock+Garden', 'https://placehold.co/900x600/1e293b/e2e8f0?text=Chandigarh+Rock+Garden', 'Rock garden mosaics', 'Placeholder', 'CC0', NULL, NULL, 'architecture', 1
FROM public.destinations d WHERE d.slug = 'chandigarh'
ON CONFLICT DO NOTHING;

-- Seeded 54 destinations, 36 states/UTs.