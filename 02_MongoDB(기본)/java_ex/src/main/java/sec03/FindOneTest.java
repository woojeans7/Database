package sec03;

import app.Database;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

public class FindOneTest {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");

        String id = "68352785b040052d85413aad";
        Bson query = Filters.eq("_id", new ObjectId(id));

        Document doc = collection.find(query).first();
        System.out.println("FindResult : " + doc);

        Database.close();
    }
}
