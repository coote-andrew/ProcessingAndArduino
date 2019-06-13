import processing.serial.*;
Serial myPort;
Table table = new Table();
int numReadings = 500;
int readingCounter = 0;

String fileName = "data.csv";
String val;
void setup()
{
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  if (frame != null);
  surface.setResizable(true);
  table.addColumn("id");
  
  table.addColumn("year");
  table.addColumn("month");
  table.addColumn("day");
  table.addColumn("hour");
  table.addColumn("minute");
  table.addColumn("second");
  table.addColumn("Temp");
}

void serialEvent(Serial myPort){
  try{
    val = myPort.readStringUntil('\n');
    if (val != null){
      val = trim(val);
      println(val);
      
      TableRow newRow = table.addRow();
      newRow.setInt("id", table.lastRowIndex());
   
      newRow.setInt("year", year());
      newRow.setInt("month", month());
      newRow.setInt("day", day());
      newRow.setInt("hour", hour());
      newRow.setInt("minute", minute());
      newRow.setInt("second", second());
      newRow.setString("Temp", val);
      readingCounter++;
   
      if (readingCounter % numReadings ==0)
      {
         saveTable(table, fileName);
      }
    }
  }catch(Exception e){
    e.printStackTrace();
  }
}

void draw(){
background(255,255,150);
}
