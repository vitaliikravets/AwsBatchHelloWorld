package com.experiments.helloworld;

import org.apache.commons.cli.*;

import java.util.Arrays;

public class Main {
    public static void main(String[] args){

        System.out.println("All arguments:" + Arrays.toString(args));


        CommandLineParser parser = new DefaultParser();
        try {
            Options options = new Options();
            options.addOption("m","marketplaceId", true,  "Id of that shit");

            CommandLine line = parser.parse( options, args );
            String marketplaceId = line.getOptionValue("marketplaceId");
            System.out.println("marketplaceId arguments value:" + marketplaceId);
        }catch( ParseException exp ) {
            System.err.println( "Parsing failed.  Reason: " + exp.getMessage() );
        }

    }
}