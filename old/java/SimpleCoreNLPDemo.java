import edu.stanford.nlp.simple.*;

public class SimpleCoreNLPDemo {
    public static void main(String [] args) {
        Document doc = new Document("add your text here! It can contain multiple sentences.");
        for(Sentence sent : doc.sentences() ) {
            System.out.println("The second word of the sentence '" + sent + "' is " + sent.word(1));
        }
    }
}
//Sentence sent = new sentence("Lucy is in the sky with diamonds.");
//List<String> nerTags = sent.nerTags();
//Strin 
