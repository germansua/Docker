#!/usr/bin/java --source 11

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Main {

    private static final String DOCKER_IMAGE_COMMAND = "docker images";
    private static final String DOCKER_IMAGE_DELETE_COMMAND = "docker image rm";
    private static final String NONE_IMAGE = "<none>";

    public static void main(String[] args) throws Exception {

        var runtime = Runtime.getRuntime();
        var listImagesProcess = runtime.exec(DOCKER_IMAGE_COMMAND);

        try (var listImagesReader = new BufferedReader(new InputStreamReader(listImagesProcess.getInputStream()))) {
            var imageIds = listImagesReader.lines()
                    .filter(line -> line.startsWith(NONE_IMAGE))
                    .map(Main::extractImageId)
                    .collect(Collectors.joining(" "));

            var finalRemoveCommand = String.format("%s %s", DOCKER_IMAGE_DELETE_COMMAND, imageIds);
            var removeImagesProcess = runtime.exec(finalRemoveCommand);

            Scanner removeImagesScanner = new Scanner(removeImagesProcess.getInputStream());
            while (removeImagesScanner.hasNextLine()) {
                System.out.println(removeImagesScanner.nextLine());
            }
            removeImagesScanner.close();
        }
    }

    private static String extractImageId(String line) {
        return Arrays.stream(line.split("\\s"))
                .filter(str -> !str.isEmpty())
                .reduce("", Main::returnLongestString);
    }

    private static String returnLongestString(String one, String two) {
        return one.length() > two.length() ? one : two;
    }
}
